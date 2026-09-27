/**
 * ═══════════════════════════════════════════════════════════════════════
 * Manodemy Live ₹100 SQL Bug Bounty Arena — Biometrics & Security Suite
 * File: bounty-biometrics.js
 * ═══════════════════════════════════════════════════════════════════════
 */

class BountyBiometrics {
  constructor() {
    this.keyEvents = [];
    this.backspaceCount = 0;
    this.pasteAttempts = 0;
    this.startTime = null;
    this.boundKeyHandler = this.onKeyDown.bind(this);
    this.boundPasteHandler = this.onPaste.bind(this);
  }

  attach(editorElement) {
    if (!editorElement) return;
    editorElement.addEventListener('keydown', this.boundKeyHandler, true);
    editorElement.addEventListener('paste', this.boundPasteHandler, true);
  }

  detach(editorElement) {
    if (!editorElement) return;
    editorElement.removeEventListener('keydown', this.boundKeyHandler, true);
    editorElement.removeEventListener('paste', this.boundPasteHandler, true);
  }

  reset() {
    this.keyEvents = [];
    this.backspaceCount = 0;
    this.pasteAttempts = 0;
    this.startTime = performance.now();
  }

  onKeyDown(e) {
    const now = performance.now();
    if (!this.startTime) this.startTime = now;

    if (e.key === 'Backspace' || e.key === 'Delete') {
      this.backspaceCount++;
    }

    // Intercept Ctrl+V / Cmd+V
    if ((e.ctrlKey || e.metaKey) && (e.key === 'v' || e.key === 'V')) {
      e.preventDefault();
      e.stopPropagation();
      this.pasteAttempts++;
      if (window.BountyUI && window.BountyUI.showToast) {
        window.BountyUI.showToast('⚠️ Paste is disabled in Bug Bounty. Type your fix!', 'warning');
      }
      return false;
    }

    this.keyEvents.push({
      t: Math.round(now - this.startTime),
      k: e.key.length === 1 ? 'c' : e.key
    });
  }

  onPaste(e) {
    e.preventDefault();
    e.stopPropagation();
    this.pasteAttempts++;
    if (window.BountyUI && window.BountyUI.showToast) {
      window.BountyUI.showToast('⚠️ Paste is disabled in Bug Bounty. Type your fix!', 'warning');
    }
    return false;
  }

  evaluateHumanity() {
    const count = this.keyEvents.length;
    if (count < 3) {
      return {
        isHuman: false,
        confidence: 0.1,
        reason: 'insufficient_keystrokes',
        metrics: { keyCount: count, backspaces: this.backspaceCount, pasteAttempts: this.pasteAttempts }
      };
    }

    const deltas = [];
    for (let i = 1; i < count; i++) {
      deltas.push(this.keyEvents[i].t - this.keyEvents[i - 1].t);
    }

    const avg = deltas.reduce((a, b) => a + b, 0) / (deltas.length || 1);
    const variance = deltas.reduce((a, b) => a + Math.pow(b - avg, 2), 0) / (deltas.length || 1);

    // If variance is near 0, typing was programmatic / robotic
    const isHuman = variance > 15;
    return {
      isHuman,
      confidence: isHuman ? 0.95 : 0.2,
      variance: Math.round(variance),
      metrics: {
        keyCount: count,
        backspaces: this.backspaceCount,
        pasteAttempts: this.pasteAttempts,
        avgIntervalMs: Math.round(avg),
        variance: Math.round(variance)
      }
    };
  }
}

const BountySanitizer = {
  /**
   * Fixes iOS / Android Smart Punctuation (Curly Quotes, En-dashes)
   */
  normalizeSQL(rawSQL) {
    if (!rawSQL) return '';
    return rawSQL
      .replace(/[\u2018\u2019\u201A\u201B\u2032\u2035]/g, "'") // single curly quotes
      .replace(/[\u201C\u201D\u201E\u201F\u2033\u2036]/g, '"') // double curly quotes
      .replace(/[\u2013\u2014]/g, '--')                         // en-dash / em-dash
      .replace(/\u00A0/g, ' ');                                 // non-breaking space
  },

  /**
   * Sanitizes Indian Mobile Number to E.164 format and validates Indian pattern
   */
  sanitizeIndianPhone(rawPhone) {
    if (!rawPhone) return { valid: false, error: 'Please enter your 10-digit WhatsApp number.' };
    let digits = rawPhone.replace(/\D/g, '');

    // Strip leading 0
    if (digits.length === 11 && digits.startsWith('0')) {
      digits = digits.slice(1);
    }
    // Strip 91 prefix if 12 digits
    if (digits.length === 12 && digits.startsWith('91')) {
      digits = digits.slice(2);
    }

    if (!/^[6-9]\d{9}$/.test(digits)) {
      return { valid: false, error: 'Invalid Indian mobile number. Must be 10 digits starting with 6-9.' };
    }

    // Reject obvious sequences
    if (/^(\d)\1{9}$/.test(digits) || digits === '1234567890') {
      return { valid: false, error: 'Please enter a genuine mobile number to receive prize updates.' };
    }

    return {
      valid: true,
      e164: `+91${digits}`,
      raw: digits
    };
  },

  /**
   * Validates UPI handle and provides helpful suggestions for common errors
   */
  validateUPI(rawUPI) {
    if (!rawUPI) return { valid: false, error: 'Please enter your UPI ID (GPay / PhonePe / Paytm).' };
    const clean = rawUPI.trim().toLowerCase();
    const upiRegex = /^[\w.\-_]{2,256}@[a-zA-Z]{2,64}$/;

    if (!upiRegex.test(clean)) {
      return { valid: false, error: 'Invalid UPI ID format. Example: yourname@okaxis or 9876543210@paytm' };
    }

    if (clean.endsWith('@gpay')) {
      return { valid: false, error: 'Google Pay IDs end with @okaxis, @okhdfcbank, @oksbi, or @okicici (not @gpay).' };
    }

    return { valid: true, cleanUPI: clean };
  },

  /**
   * Sanitizes public leaderboard display names against XSS and abuse
   */
  sanitizeDisplayName(rawName) {
    if (!rawName) return 'Anonymous Coder';
    let clean = rawName.replace(/<[^>]*>/g, '').trim();
    clean = clean.replace(/(https?:\/\/|\.com|\.in|\.org|\.xyz|\.net)/gi, '');
    const bannedPatterns = [/\b(scam|fraud|hack|bot|fuck|shit|bitch|poda|thevidiya|punda)\b/gi];
    for (const pattern of bannedPatterns) {
      clean = clean.replace(pattern, '***');
    }
    if (clean.length < 2) return 'Anonymous Coder';
    return clean.slice(0, 24);
  },

  /**
   * Generates NPCI-compliant universal UPI intent URI
   */
  generateNPCIUniversalURI(upiId, recipientName, dayNumber) {
    const cleanUPI = encodeURIComponent(upiId.trim().toLowerCase());
    const cleanName = encodeURIComponent((recipientName || 'Winner').trim().slice(0, 20));
    const note = encodeURIComponent(`Manodemy Day ${dayNumber} Bug Bounty`);
    return `upi://pay?pa=${cleanUPI}&pn=${cleanName}&am=100&cu=INR&tn=${note}`;
  },

  /**
   * Client-side fast SHA-256 phone hash
   */
  async hashPhone(phoneE164) {
    if (window.crypto && crypto.subtle) {
      const enc = new TextEncoder().encode(`manodemy_salt_${phoneE164}`);
      const buf = await crypto.subtle.digest('SHA-256', enc);
      return Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join('');
    }
    // Fallback DJB2 hash
    let hash = 5381;
    for (let i = 0; i < phoneE164.length; i++) {
      hash = ((hash << 5) + hash) + phoneE164.charCodeAt(i);
      hash |= 0;
    }
    return `fb_${Math.abs(hash).toString(16)}`;
  },

  /**
   * Invisible Client Micro-Proof-of-Work (< 15ms computation) to prevent DDoS spam
   */
  async generateMicroPoW(phoneHash, challengeId) {
    if (!window.crypto || !crypto.subtle) return 'pow_unsupported';
    let nonce = 0;
    const prefix = `${phoneHash}_${challengeId}_`;
    while (nonce < 2000) {
      const enc = new TextEncoder().encode(prefix + nonce);
      const buf = await crypto.subtle.digest('SHA-256', enc);
      const hex = Array.from(new Uint8Array(buf)).map(b => b.toString(16).padStart(2, '0')).join('');
      if (hex.startsWith('00')) {
        return `pow_${nonce}_${hex.slice(0, 8)}`;
      }
      nonce++;
    }
    return `pow_default_${Date.now()}`;
  }
};

window.BountyBiometrics = BountyBiometrics;
window.BountySanitizer = BountySanitizer;
