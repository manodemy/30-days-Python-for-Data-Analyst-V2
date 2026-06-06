/**
 * Manodemy Intelligence Suite — Telemetry Engine v4.0 (Enterprise Offline Sync)
 * ═══════════════════════════════════════════════════════════════════════════════
 *
 * ARCHITECTURE:
 *   ┌─────────────────────────────────────────────────────────────────────────┐
 *   │   Event Emitter  →  Online Check  →  [Supabase REST]                   │
 *   │                           ↓ offline                                     │
 *   │                   IndexedDB Queue  ←→  LocalStorage Fallback            │
 *   │                           ↓ reconnect                                   │
 *   │              Flush Pipeline (Batch + Exponential Backoff)               │
 *   └─────────────────────────────────────────────────────────────────────────┘
 *
 * VISIT COUNTING LOGIC (GA4-style):
 *   - A "visit" = one session. Session resets after 30 min of inactivity.
 *   - Every page load within the same session shares the same session_id.
 *   - Sessions are stored in sessionStorage (NOT localStorage).
 *
 * TIME SPENT LOGIC (Market-standard):
 *   - Active time only — pauses when tab is hidden (visibilitychange).
 *   - Tracks active_seconds accurately using periodic heartbeats every 30s.
 *   - Final flush on page unload using fetch keepalive.
 *
 * OFFLINE SYNC:
 *   - IndexedDB store: manodemy_telemetry_queue (named per spec)
 *   - Per-item retry counters with exponential backoff (max 5 retries, cap 60s)
 *   - Bulk batch flush (up to 10 events per tick, non-blocking via async)
 *   - Original client-side timestamps preserved on all queued items
 *   - localStorage fallback if IndexedDB is unavailable (e.g. Firefox Private Mode)
 */
(function () {
  if (window.ManodemyTelemetry) return; // Already initialized

  // ── Constants ─────────────────────────────────────────────────────────────
  const SESSION_TIMEOUT_MS   = 30 * 60 * 1000; // 30 min inactivity = new session
  const HEARTBEAT_INTERVAL_MS = 30 * 1000;      // Heartbeat every 30s
  const MIN_ENGAGEMENT_SECS  = 5;               // Ignore < 5s sessions
  const MAX_QUEUE_SIZE       = 200;             // Max items in offline queue
  const FLUSH_BATCH_SIZE     = 10;             // Events per flush tick
  const MAX_ITEM_RETRIES     = 5;              // Per-item retry limit before discard
  const MAX_BACKOFF_MS       = 60000;          // Cap exponential backoff at 60s

  // IndexedDB config — named per specification
  const DB_NAME   = 'manodemy_telemetry_queue';  // Required name per spec
  const DB_VERSION = 2;
  const STORE_NAME = 'events';

  // LocalStorage fallback key
  const LS_KEY = 'manodemy_telemetry_queue_ls';

  // ── IndexedDB: Open / Upgrade ──────────────────────────────────────────────
  let _dbPromise = null;

  function openDB() {
    if (_dbPromise) return _dbPromise;
    _dbPromise = new Promise((resolve, reject) => {
      if (!window.indexedDB) {
        reject(new Error('IndexedDB not supported'));
        return;
      }
      const req = indexedDB.open(DB_NAME, DB_VERSION);

      req.onupgradeneeded = (e) => {
        const db = e.target.result;
        // Create or upgrade the events object store
        if (!db.objectStoreNames.contains(STORE_NAME)) {
          const store = db.createObjectStore(STORE_NAME, {
            keyPath: 'id',
            autoIncrement: true
          });
          // Index for quick per-table queries
          store.createIndex('table_idx', 'table', { unique: false });
          // Index for timestamp ordering (preserve original client timestamps)
          store.createIndex('ts_idx', 'clientTimestamp', { unique: false });
        } else {
          // Upgrade path: add ts_idx if missing (v1 → v2)
          const store = e.currentTarget.transaction.objectStore(STORE_NAME);
          if (!store.indexNames.contains('ts_idx')) {
            store.createIndex('ts_idx', 'clientTimestamp', { unique: false });
          }
        }
      };

      req.onsuccess = (e) => resolve(e.target.result);
      req.onerror   = (e) => {
        _dbPromise = null; // Allow retry
        reject(e.target.error);
      };
      req.onblocked = () => {
        console.warn('[Telemetry:IDB] Database upgrade blocked — close other tabs.');
      };
    });
    return _dbPromise;
  }

  // ── IndexedDB CRUD (async, non-blocking) ───────────────────────────────────

  async function idbGetAll() {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx    = db.transaction(STORE_NAME, 'readonly');
      const store = tx.objectStore(STORE_NAME);
      // Use ts_idx cursor for ordered retrieval (oldest-first)
      const index  = store.index('ts_idx');
      const result = [];
      const req    = index.openCursor();
      req.onsuccess = (e) => {
        const cursor = e.target.result;
        if (cursor) {
          result.push(cursor.value);
          cursor.continue();
        } else {
          resolve(result);
        }
      };
      req.onerror = () => reject(req.error);
    });
  }

  async function idbCount() {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx    = db.transaction(STORE_NAME, 'readonly');
      const store = tx.objectStore(STORE_NAME);
      const req   = store.count();
      req.onsuccess = () => resolve(req.result);
      req.onerror   = () => reject(req.error);
    });
  }

  async function idbAdd(item) {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx    = db.transaction(STORE_NAME, 'readwrite');
      const store = tx.objectStore(STORE_NAME);
      const req   = store.add(item);
      req.onsuccess = () => resolve(req.result); // returns auto-incremented id
      req.onerror   = () => reject(req.error);
    });
  }

  async function idbDelete(id) {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx    = db.transaction(STORE_NAME, 'readwrite');
      const store = tx.objectStore(STORE_NAME);
      const req   = store.delete(id);
      req.onsuccess = () => resolve();
      req.onerror   = () => reject(req.error);
    });
  }

  async function idbUpdate(item) {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx    = db.transaction(STORE_NAME, 'readwrite');
      const store = tx.objectStore(STORE_NAME);
      const req   = store.put(item); // put = upsert by keyPath id
      req.onsuccess = () => resolve();
      req.onerror   = () => reject(req.error);
    });
  }

  async function idbEvictOldest() {
    const db = await openDB();
    return new Promise((resolve, reject) => {
      const tx    = db.transaction(STORE_NAME, 'readwrite');
      const store = tx.objectStore(STORE_NAME);
      const index = store.index('ts_idx');
      const req   = index.openCursor(); // First (oldest) entry
      req.onsuccess = (e) => {
        const cursor = e.target.result;
        if (cursor) {
          cursor.delete();
          resolve();
        } else {
          resolve(); // Already empty
        }
      };
      req.onerror = () => reject(req.error);
    });
  }

  // ── LocalStorage Fallback ──────────────────────────────────────────────────

  const LSFallback = {
    getAll() {
      try {
        return JSON.parse(localStorage.getItem(LS_KEY) || '[]');
      } catch { return []; }
    },
    push(item) {
      try {
        const q = this.getAll();
        if (q.length >= MAX_QUEUE_SIZE) q.shift();
        item.id = Date.now() + '_' + Math.random().toString(36).slice(2, 8);
        q.push(item);
        localStorage.setItem(LS_KEY, JSON.stringify(q));
      } catch { /* quota exceeded — silently drop */ }
    },
    remove(id) {
      try {
        const q = this.getAll().filter(i => i.id !== id);
        localStorage.setItem(LS_KEY, JSON.stringify(q));
      } catch { }
    },
    update(item) {
      try {
        const q = this.getAll().map(i => i.id === item.id ? item : i);
        localStorage.setItem(LS_KEY, JSON.stringify(q));
      } catch { }
    }
  };

  // ── Queue Manager ──────────────────────────────────────────────────────────
  // Unified interface over IndexedDB with automatic LocalStorage fallback.

  const QueueManager = {
    _useLS: false,

    async init() {
      try {
        await openDB();
        this._useLS = false;
        console.log('[Telemetry:Queue] ✅ IndexedDB ready (manodemy_telemetry_queue)');
      } catch (e) {
        this._useLS = true;
        console.warn('[Telemetry:Queue] ⚠️ IndexedDB unavailable — using localStorage fallback:', e.message);
      }
    },

    /**
     * Push a new telemetry event to the offline queue.
     * Preserves clientTimestamp so analytics can reconstruct real event timing.
     *
     * @param {string} table       - Supabase table name
     * @param {object} payload     - Event row data
     * @param {number} [clientTs]  - Original client-side timestamp (ms since epoch)
     */
    async push(table, payload, clientTs) {
      const item = {
        table,
        payload,
        clientTimestamp: clientTs || Date.now(),
        retries: 0,
        lastAttempt: null
      };

      if (this._useLS) {
        LSFallback.push(item);
        return;
      }

      try {
        const count = await idbCount();
        if (count >= MAX_QUEUE_SIZE) {
          await idbEvictOldest(); // Drop oldest to make room
          console.warn('[Telemetry:Queue] Max queue size reached — evicted oldest event.');
        }
        await idbAdd(item);
      } catch (e) {
        // IDB failed mid-session — fall back to LS for this item
        console.warn('[Telemetry:Queue] IDB write failed, falling back to LS:', e.message);
        LSFallback.push(item);
      }
    },

    async getAll() {
      if (this._useLS) return LSFallback.getAll();
      try {
        return await idbGetAll();
      } catch (e) {
        return LSFallback.getAll();
      }
    },

    async remove(id) {
      if (this._useLS) { LSFallback.remove(id); return; }
      try {
        await idbDelete(id);
      } catch (e) {
        LSFallback.remove(id);
      }
    },

    async update(item) {
      if (this._useLS) { LSFallback.update(item); return; }
      try {
        await idbUpdate(item);
      } catch (e) {
        LSFallback.update(item);
      }
    }
  };

  // ── Session Management (GA4-style) ────────────────────────────────────────

  function getOrCreateSession() {
    const now = Date.now();
    let sid = sessionStorage.getItem('mano_sid');
    const lastActivity = parseInt(sessionStorage.getItem('mano_last_activity') || '0', 10);

    if (!sid || (now - lastActivity) > SESSION_TIMEOUT_MS) {
      sid = 'sess_' + now + '_' + Math.random().toString(36).substring(2, 10);
      sessionStorage.setItem('mano_sid', sid);
      sessionStorage.setItem('mano_session_page_count', '0');
    }
    sessionStorage.setItem('mano_last_activity', String(now));
    return sid;
  }

  // ── Flush Pipeline with Exponential Backoff ────────────────────────────────

  const FlushPipeline = {
    _running: false,
    _globalAttempt: 0,
    _backoffTimer: null,

    /**
     * Trigger a flush cycle. Safe to call repeatedly — debounced internally.
     */
    trigger(T) {
      if (this._backoffTimer) return; // Already scheduled
      if (this._running) return;      // Already in-flight
      this._runFlush(T);
    },

    async _runFlush(T) {
      if (this._running || !navigator.onLine) return;
      this._running = true;

      try {
        const queue = await QueueManager.getAll();
        if (queue.length === 0) {
          this._globalAttempt = 0;
          this._running = false;
          return;
        }

        console.log(`[Telemetry:Flush] 🔄 Processing ${queue.length} queued event(s) in batches of ${FLUSH_BATCH_SIZE}…`);

        let failedAny = false;

        // Process in batches for non-blocking throughput
        for (let i = 0; i < queue.length; i += FLUSH_BATCH_SIZE) {
          if (!navigator.onLine) {
            console.log('[Telemetry:Flush] ⏸ Went offline mid-flush. Pausing.');
            failedAny = true;
            break;
          }

          const batch = queue.slice(i, i + FLUSH_BATCH_SIZE);

          // Process each item in the batch concurrently
          const results = await Promise.allSettled(
            batch.map(item => this._processItem(T, item))
          );

          // Check for failures in this batch
          for (const r of results) {
            if (r.status === 'rejected' || r.value === false) {
              failedAny = true;
            }
          }

          if (failedAny) break; // Don't proceed to next batch on failure
        }

        this._running = false;

        // Re-check queue after flush
        const remaining = await QueueManager.getAll();
        if (remaining.length > 0 && failedAny) {
          this._globalAttempt++;
          const delay = Math.min(1000 * Math.pow(2, this._globalAttempt), MAX_BACKOFF_MS);
          console.log(`[Telemetry:Flush] ⏳ ${remaining.length} events remain. Retrying in ${delay}ms (attempt ${this._globalAttempt}).`);
          this._backoffTimer = setTimeout(() => {
            this._backoffTimer = null;
            this._runFlush(T);
          }, delay);
        } else {
          this._globalAttempt = 0;
          if (remaining.length === 0) {
            console.log('[Telemetry:Flush] ✅ All queued events successfully flushed.');
          }
        }

      } catch (err) {
        this._running = false;
        console.warn('[Telemetry:Flush] ❌ Flush pipeline error:', err.message);
      }
    },

    /**
     * Send a single queued item to Supabase.
     * Preserves the original clientTimestamp in the payload metadata.
     * Increments retry counter; discards after MAX_ITEM_RETRIES.
     *
     * @returns {boolean} true = success/discard, false = retry needed
     */
    async _processItem(T, item) {
      // Preserve original client-side timestamp in payload
      const enrichedPayload = {
        ...item.payload,
        metadata: {
          ...(item.payload.metadata || {}),
          offline_queued_at: new Date(item.clientTimestamp).toISOString(),
          offline_synced_at: new Date().toISOString(),
          retries: item.retries
        }
      };

      try {
        if (!T.sb) return true; // No Supabase client — discard gracefully
        const { error } = await T.sb.from(item.table).insert([enrichedPayload]);

        if (!error) {
          await QueueManager.remove(item.id);
          console.log(`[Telemetry:Flush] ✅ Synced event #${item.id} → ${item.table}`);
          return true;
        }

        const status = error.status || 0;

        // 4xx client errors are non-retryable (bad schema, RLS deny) — discard
        if (status >= 400 && status < 500) {
          console.warn(`[Telemetry:Flush] 🗑 Discarding event #${item.id} (${status} client error): ${error.message}`);
          await QueueManager.remove(item.id);
          return true; // Treated as success (don't block flush)
        }

        // 5xx server errors or network issues — increment retry counter
        item.retries = (item.retries || 0) + 1;
        item.lastAttempt = Date.now();

        if (item.retries >= MAX_ITEM_RETRIES) {
          console.warn(`[Telemetry:Flush] 🗑 Discarding event #${item.id} after ${MAX_ITEM_RETRIES} retries.`);
          await QueueManager.remove(item.id);
          return true; // Give up — don't block
        }

        await QueueManager.update(item); // Save incremented retry count
        console.warn(`[Telemetry:Flush] ⚠️ Event #${item.id} failed (retry ${item.retries}/${MAX_ITEM_RETRIES}): ${error.message}`);
        return false;

      } catch (err) {
        // Network exception
        item.retries = (item.retries || 0) + 1;
        item.lastAttempt = Date.now();

        if (item.retries >= MAX_ITEM_RETRIES) {
          await QueueManager.remove(item.id);
          return true;
        }

        await QueueManager.update(item);
        console.warn(`[Telemetry:Flush] ⚠️ Network exception for event #${item.id}:`, err.message);
        return false;
      }
    }
  };

  // ── Core Telemetry Engine ──────────────────────────────────────────────────

  const T = window.ManodemyTelemetry = {
    sb: null,
    sessionId: null,
    userId: null,
    _activeStart: null,
    _totalActiveSecs: 0,
    _heartbeatTimer: null,
    _flushed: false,

    init: async function () {
      if (!window.MANODEMY_CONFIG || !window.MANODEMY_CONFIG.SUPA_URL) {
        console.warn('[Telemetry] MANODEMY_CONFIG missing. Telemetry disabled.');
        return;
      }

      // Reuse existing sb client if already created by landing/home pages
      this.sb = window.sb || (window.supabase && supabase.createClient(
        window.MANODEMY_CONFIG.SUPA_URL,
        window.MANODEMY_CONFIG.SUPA_KEY
      ));

      this.sessionId = getOrCreateSession();

      try {
        const { data: { session } } = await this.sb.auth.getSession();
        this.userId = session?.user?.id || null;
      } catch (e) {
        this.userId = null;
      }

      // Initialize queue storage (IDB or LS fallback)
      await QueueManager.init();

      // Flush any events that were queued during a previous offline session
      FlushPipeline.trigger(this);

      // Track current page view
      await this._trackPageView();

      // Start active time tracker
      this._startActiveTimer();

      // Pause/resume on tab visibility changes
      document.addEventListener('visibilitychange', () => {
        if (document.visibilityState === 'hidden') {
          this._pauseActiveTimer();
          this._flushSession(false);
        } else {
          this._resumeActiveTimer();
        }
      });

      // Reconnect → trigger queue flush
      window.addEventListener('online', () => {
        console.log('[Telemetry] 🌐 Back online — triggering queue flush…');
        FlushPipeline.trigger(this);
      });

      // Log when going offline
      window.addEventListener('offline', () => {
        console.log('[Telemetry] 📴 Offline detected — telemetry events will be queued.');
      });

      // Final session flush on unload
      window.addEventListener('pagehide', () => this._flushSession(true));
      window.addEventListener('beforeunload', () => this._flushSession(true));

      console.log(`[Telemetry] ✅ Initialized | Session: ${this.sessionId} | User: ${this.userId || 'anon'}`);
    },

    _trackPageView: async function () {
      const pageCount = parseInt(sessionStorage.getItem('mano_session_page_count') || '0', 10);
      sessionStorage.setItem('mano_session_page_count', String(pageCount + 1));

      const payload = {
        session_id: this.sessionId,
        page_url: window.location.pathname,
        referrer: document.referrer || null,
        country: null
      };
      if (this.userId) payload.user_id = this.userId;

      await this._queueOrSend('page_views', payload);
    },

    _startActiveTimer: function () {
      if (document.visibilityState !== 'hidden') {
        this._activeStart = Date.now();
      }

      this._heartbeatTimer = setInterval(() => {
        this._accumulateActive();

        if (this.userId && this._totalActiveSecs > 0) {
          // Support both legacy dayXX.html paths and new /notebook/dayXX paths
          const dayMatch = window.location.pathname.match(/day(\d{2})(?:\.html)?$/);
          const lsKey = dayMatch ? `manodemy_day${dayMatch[1]}_time_spent` : null;
          const lsSecs = lsKey ? parseInt(localStorage.getItem(lsKey) || '0', 10) : 0;
          const bestSecs = Math.max(this._totalActiveSecs, lsSecs);

          this._writeActivityLog('session_heartbeat', {
            session_id: this.sessionId,
            active_seconds: bestSecs,
            page_url: window.location.pathname
          });
        }
        sessionStorage.setItem('mano_last_activity', String(Date.now()));
      }, HEARTBEAT_INTERVAL_MS);
    },

    _pauseActiveTimer: function () {
      this._accumulateActive();
      this._activeStart = null;
    },

    _resumeActiveTimer: function () {
      this._activeStart = Date.now();
      sessionStorage.setItem('mano_last_activity', String(Date.now()));
    },

    _accumulateActive: function () {
      if (this._activeStart) {
        const elapsed = Math.round((Date.now() - this._activeStart) / 1000);
        this._totalActiveSecs += elapsed;
        this._activeStart = Date.now();
      }
    },

    _flushSession: function (useBeacon) {
      if (this._flushed || !this.userId) return;
      this._flushed = true;
      clearInterval(this._heartbeatTimer);

      this._accumulateActive();

      // Support both /dayXX.html and /notebook/dayXX paths
      const dayMatch = window.location.pathname.match(/day(\d{2})(?:\.html)?$/);
      const lsKey = dayMatch ? `manodemy_day${dayMatch[1]}_time_spent` : null;
      const lsTotal = lsKey ? parseInt(localStorage.getItem(lsKey) || '0', 10) : 0;
      const finalSecs = Math.max(this._totalActiveSecs, lsTotal);

      if (finalSecs < MIN_ENGAGEMENT_SECS) return;

      const payload = {
        user_id: this.userId,
        event_type: 'session_end',
        page_url: window.location.pathname,
        metadata: {
          session_id: this.sessionId,
          duration_seconds: finalSecs,
          active_seconds: finalSecs
        }
      };

      const clientTs = Date.now();

      if (!navigator.onLine) {
        // Queue asynchronously — can't await in beforeunload but fire-and-forget is OK
        QueueManager.push('activity_logs', payload, clientTs).catch(() => {
          LSFallback.push({ table: 'activity_logs', payload, clientTimestamp: clientTs, retries: 0 });
        });
        return;
      }

      // Use keepalive fetch for reliable unload delivery
      fetch(`${window.MANODEMY_CONFIG.SUPA_URL}/rest/v1/activity_logs`, {
        method: 'POST',
        keepalive: true,
        headers: {
          'Content-Type': 'application/json',
          'apikey': window.MANODEMY_CONFIG.SUPA_KEY,
          'Authorization': `Bearer ${this._getAccessToken()}`,
          'Prefer': 'return=minimal'
        },
        body: JSON.stringify(payload)
      }).catch(() => {
        // If fetch fails, queue it for the next page load
        LSFallback.push({ table: 'activity_logs', payload, clientTimestamp: clientTs, retries: 0 });
      });

      console.log(`[Telemetry] ✅ Session flush | Active: ${finalSecs}s`);
    },

    _writeActivityLog: async function (eventType, metadata) {
      if (!this.userId) return;
      const payload = {
        user_id: this.userId,
        event_type: eventType,
        page_url: window.location.pathname,
        metadata
      };
      await this._queueOrSend('activity_logs', payload);
    },

    /**
     * Route a telemetry write through online check → direct send or queue.
     * Preserves the original call timestamp for queued events.
     *
     * @param {string} table
     * @param {object} payload
     */
    _queueOrSend: async function (table, payload) {
      if (!payload.user_id && this.userId) {
        payload.user_id = this.userId;
      }

      const clientTs = Date.now(); // Capture original timestamp before any async ops

      if (!navigator.onLine) {
        console.log(`[Telemetry] 📥 Offline — queuing event for ${table}.`);
        await QueueManager.push(table, payload, clientTs);
        return;
      }

      try {
        if (!this.sb) return;
        const { error } = await this.sb.from(table).insert([payload]);

        if (!error) {
          // Event delivered successfully
          return;
        }

        const status = error.status || 0;

        // 4xx = client error (bad payload, RLS violation) → discard, don't queue
        if (status >= 400 && status < 500) {
          console.warn(`[Telemetry] 🗑 Discarding event (${status}): ${error.message}`);
          return;
        }

        // 5xx or network issue → queue with original timestamp
        console.log(`[Telemetry] 📥 Server error (${status}) — queuing event for ${table}.`);
        await QueueManager.push(table, payload, clientTs);
        FlushPipeline.trigger(this);

      } catch (err) {
        console.log(`[Telemetry] 📥 Network exception — queuing event for ${table}.`);
        await QueueManager.push(table, payload, clientTs);
        FlushPipeline.trigger(this);
      }
    },

    /**
     * Manually trigger a queue flush. Called by external scripts (e.g. notebook.js)
     * after question_solved events are written.
     */
    flushQueue: function () {
      FlushPipeline.trigger(this);
    },

    _getAccessToken: function () {
      try {
        const storageKey = Object.keys(localStorage).find(k => k.includes('auth-token'));
        if (storageKey) {
          const parsed = JSON.parse(localStorage.getItem(storageKey));
          return parsed?.access_token || window.MANODEMY_CONFIG.SUPA_KEY;
        }
      } catch { }
      return window.MANODEMY_CONFIG.SUPA_KEY;
    }
  };

  // ── Bootstrap ──────────────────────────────────────────────────────────────
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => T.init());
  } else {
    T.init();
  }

})();
