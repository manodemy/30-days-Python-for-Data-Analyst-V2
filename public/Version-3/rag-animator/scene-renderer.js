/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Scene Renderer (v2.0)
   100% GSAP Master Timeline-Driven 2D HUD & Typography Layer
   Every Enter, Exit & State Transition is a GSAP Tween —
   Zero setTimeout, Frame-Exact Scrubber Seeking & Reversal
   ═══════════════════════════════════════════════════════════════════ */

(function (root) {
  'use strict';

  /* ── CSS injected once ── */
  const SR_STYLE_ID = 'sr-injected-styles';
  function injectStyles() {
    if (document.getElementById(SR_STYLE_ID)) return;
    const style = document.createElement('style');
    style.id = SR_STYLE_ID;
    style.textContent = `
      /* SceneRenderer canvas layer */
      .sr-canvas {
        position: absolute;
        inset: 0;
        overflow: hidden;
        z-index: 3;
        pointer-events: none;
      }

      /* Every scene element */
      .sr-element {
        position: absolute;
        box-sizing: border-box;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        line-height: 1.5;
        pointer-events: auto;
      }

      /* ── Element type base styles ── */
      .sr-heading {
        margin: 0;
        font-weight: 800;
        color: inherit;
        font-size: inherit;
        letter-spacing: -0.02em;
        line-height: 1.2;
        display: inline-block;
        white-space: nowrap;
        background: rgba(255, 255, 255, 0.95);
        padding: 5px 20px;
        border-radius: 12px;
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        box-shadow: 0 4px 18px rgba(15, 23, 42, 0.08);
        border: 1.5px solid rgba(226, 232, 240, 0.9);
        text-shadow: 0 1px 2px rgba(255, 255, 255, 0.8);
        text-align: center;
      }

      .sr-text {
        margin: 0;
        font-size: 13.5px;
        font-weight: 600;
        color: #0f172a;
        line-height: 1.5;
        display: block;
        width: 100%;
        box-sizing: border-box;
        background: rgba(255, 255, 255, 0.95);
        padding: 8px 22px;
        border-radius: 12px;
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        box-shadow: 0 3px 12px rgba(15, 23, 42, 0.08);
        border: 1.5px solid rgba(226, 232, 240, 0.9);
        text-align: center;
      }

      @media (max-width: 640px) {
        .sr-heading {
          font-size: 18px !important;
          padding: 5px 14px;
        }
        .sr-text {
          font-size: 11.5px !important;
          padding: 6px 12px;
          line-height: 1.4;
        }
      }

      .sr-badge {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        font-size: 11px;
        font-weight: 800;
        letter-spacing: 0.6px;
        text-transform: uppercase;
        padding: 5px 12px;
        border-radius: 999px;
        background: rgba(99, 102, 241, 0.12);
        border: 1.5px solid rgba(99, 102, 241, 0.3);
        color: #4338ca;
        white-space: nowrap;
        box-shadow: 0 2px 8px rgba(99, 102, 241, 0.12);
      }

      .sr-callout {
        padding: 12px 18px;
        border-radius: 10px;
        background: rgba(255, 255, 255, 0.95);
        border: 1.5px solid #e2e8f0;
        border-left: 4px solid #4f46e5;
        font-size: 13.5px;
        color: #0f172a;
        line-height: 1.6;
        box-shadow: 0 4px 16px rgba(15,23,42,0.06);
        backdrop-filter: blur(8px);
      }

      .sr-card {
        padding: 16px 20px;
        border-radius: 12px;
        background: rgba(255, 255, 255, 0.95);
        border: 1.5px solid #e2e8f0;
        font-size: 13px;
        color: #334155;
        line-height: 1.6;
        box-shadow: 0 6px 22px rgba(15,23,42,0.08);
        backdrop-filter: blur(8px);
      }

      .sr-list-item {
        padding: 11px 16px;
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.95);
        border: 1.5px solid #e2e8f0;
        font-size: 13px;
        color: #0f172a;
        line-height: 1.5;
        box-shadow: 0 3px 10px rgba(15,23,42,0.05);
        backdrop-filter: blur(6px);
      }

      .sr-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 32px;
        line-height: 1;
        user-select: none;
      }

      .sr-counter {
        display: inline-block;
        font-size: 32px;
        font-weight: 900;
        font-family: 'JetBrains Mono', monospace;
        color: #4f46e5;
        line-height: 1;
      }

      .sr-diagram svg {
        width: 100%;
        height: 100%;
        display: block;
        overflow: visible;
      }
    `;
    document.head.appendChild(style);
  }

  const TOKEN_MAP = {
    '--anim-primary':    '#4f46e5',
    '--anim-emerald':    '#10b981',
    '--anim-rose':       '#e11d48',
    '--anim-amber':      '#f59e0b',
    '--anim-cyan':       '#06b6d4',
    '--anim-text':       '#0f172a',
    '--anim-text-muted': '#64748b',
    '--anim-card':       '#ffffff',
    '--anim-border':     '#e2e8f0',
    '--anim-bg':         '#f8fafc',
  };

  function applyTokens(el) {
    for (const [k, v] of Object.entries(TOKEN_MAP)) {
      el.style.setProperty(k, v);
    }
  }

  function resolveTokens(obj) {
    const out = {};
    for (const [k, v] of Object.entries(obj)) {
      if (typeof v === 'string') {
        let resolved = v;
        for (const [token, val] of Object.entries(TOKEN_MAP)) {
          resolved = resolved.replaceAll(token, val);
        }
        out[k] = resolved;
      } else {
        out[k] = v;
      }
    }
    return out;
  }

  /* ══════════════════════════════════════════════════════
     SceneRenderer class
  ══════════════════════════════════════════════════════ */
  class SceneRenderer {
    constructor(sceneArea) {
      injectStyles();
      this.sceneArea = sceneArea;

      this.canvas = document.createElement('div');
      this.canvas.className = 'sr-canvas';
      applyTokens(this.canvas);
      sceneArea.appendChild(this.canvas);

      this._elements = [];
    }

    /**
     * Mounts an element into the DOM and sets its position & content.
     */
    mountElement(elDef) {
      if (elDef.type === 'particle-bg' || elDef.type === 'diagram' || elDef.type === 'arrow' || elDef.type === 'highlight-box') return null;

      const el = document.createElement('div');
      el.id = `sr-${elDef.id}`;
      el.setAttribute('data-sr-type', elDef.type);
      el.classList.add('sr-element', `sr-type-${elDef.type}`);

      // Position (%)
      if (elDef.position) {
        const isCenter = elDef.position.center !== false && (
          elDef.position.center === true ||
          elDef.position.x === 50 ||
          elDef.type === 'heading' ||
          (elDef.type === 'text' && elDef.position.y < 20)
        );

        if (isCenter) {
          el.style.left = '50%';
          el.style.display = 'flex';
          el.style.justifyContent = 'center';
          el.style.textAlign = 'center';
          if (root.gsap) {
            root.gsap.set(el, { xPercent: -50 });
          } else {
            el.style.transform = 'translateX(-50%)';
          }
          if (elDef.position.width != null) {
            el.style.width = `${elDef.position.width}%`;
            el.style.maxWidth = `${elDef.position.width}%`;
          } else {
            el.style.maxWidth = '88%';
          }
        } else {
          el.style.left = `${elDef.position.x}%`;
          if (elDef.position.width != null) el.style.width = `${elDef.position.width}%`;
        }

        el.style.top = `${elDef.position.y}%`;
        if (elDef.position.height != null && !['text', 'heading', 'badge', 'callout', 'card', 'metric'].includes(elDef.type)) {
          el.style.height = `${elDef.position.height}%`;
        }
      }

      // Content
      el.innerHTML = this._buildContent(elDef);

      // Style overrides
      if (elDef.style) {
        const resolved = resolveTokens(elDef.style);
        for (const [k, v] of Object.entries(resolved)) {
          if (k === 'note') continue;
          el.style[k] = v;
        }
      }

      // Initially hidden; GSAP timeline reveals it
      el.style.opacity = '0';
      this.canvas.appendChild(el);
      this._elements.push(el);
      return el;
    }

    _buildContent(elDef) {
      const c = elDef.content || '';
      switch (elDef.type) {
        case 'heading':   return `<h2 class="sr-heading">${c}</h2>`;
        case 'text':      return `<p class="sr-text">${c}</p>`;
        case 'badge':     return `<span class="sr-badge">${c}</span>`;
        case 'callout':   return `<div class="sr-callout">${c}</div>`;
        case 'card':      return `<div class="sr-card">${c}</div>`;
        case 'list-item': return `<div class="sr-list-item">${c}</div>`;
        case 'icon':      return `<span class="sr-icon">${c}</span>`;
        case 'counter':   return `<span class="sr-counter">0</span>`;
        case 'diagram':   return `<div class="sr-diagram">${c}</div>`;
        default:          return c;
      }
    }

    destroy() {
      this.canvas.innerHTML = '';
      this.canvas.remove();
      this._elements = [];
    }
  }

  /* ══════════════════════════════════════════════════════
     SceneTimeline Builder — 100% Master Timeline Hook
  ══════════════════════════════════════════════════════ */
  const SceneTimeline = {
    buildFromSceneJson(scenes, masterTl, renderer) {
      if (!scenes || !masterTl || !renderer) return;
      const G = root.gsap;
      if (!G) return;

      scenes.forEach(scene => {
        const sceneStart = scene.startAt || 0;
        const sceneEnd = scene.endAt || (sceneStart + 7.0);

        if (!Array.isArray(scene.elements)) return;

        scene.elements.forEach(elDef => {
          const el = renderer.mountElement(elDef);
          if (!el) return;

          const animEnter = elDef.animation?.enter || { type: 'fadeIn', duration: 0.5, delay: 0 };
          const animExit  = elDef.animation?.exit;
          const delay     = animEnter.delay || 0;
          const duration  = animEnter.duration || 0.5;
          const ease      = animEnter.ease || 'power2.out';
          const enterTime = sceneStart + delay;

          // Wire Enter animation onto master timeline
          switch (animEnter.type) {
            case 'fadeIn': {
              const from = animEnter.from ? resolveTokens(animEnter.from) : {};
              masterTl.fromTo(el, { opacity: 0, ...from }, { opacity: 1, duration, ease }, enterTime);
              break;
            }
            case 'slideRight':
              masterTl.fromTo(el, { opacity: 0, x: -28 }, { opacity: 1, x: 0, duration, ease }, enterTime);
              break;
            case 'slideLeft':
              masterTl.fromTo(el, { opacity: 0, x: 28 }, { opacity: 1, x: 0, duration, ease }, enterTime);
              break;
            case 'slideUp':
              masterTl.fromTo(el, { opacity: 0, y: 24 }, { opacity: 1, y: 0, duration, ease }, enterTime);
              break;
            case 'scaleUp':
              masterTl.fromTo(el, { opacity: 0, scale: 0.6 }, { opacity: 1, scale: 1, duration, ease }, enterTime);
              break;
            case 'popIn':
              masterTl.fromTo(el, { opacity: 0, scale: 0.7 }, { opacity: 1, scale: 1, duration, ease: 'back.out(1.5)' }, enterTime);
              break;
            case 'dramaticZoomIn':
              masterTl.fromTo(el,
                { opacity: 0, scale: 0.35, y: 15 },
                { opacity: 1, scale: 1.0, y: 0, duration: duration || 0.8, ease: ease || 'back.out(1.8)' },
                enterTime
              );
              break;
            case 'bounceIn':
              masterTl.fromTo(el, { opacity: 0, scale: 0.3 }, { opacity: 1, scale: 1, duration, ease: 'elastic.out(1, 0.5)' }, enterTime);
              break;
            case 'flipIn':
              masterTl.fromTo(el, { opacity: 0, rotateX: 60 }, { opacity: 1, rotateX: 0, duration, ease }, enterTime);
              break;
            case 'typewriter': {
              const target = el.querySelector('h2, p, span, div') || el;
              const fullText = target.textContent || '';
              const proxy = { len: 0 };
              masterTl.fromTo(el, { opacity: 0, y: 12 }, { opacity: 1, y: 0, duration: 0.4, ease: 'power2.out' }, enterTime);
              masterTl.fromTo(proxy, { len: 0 }, {
                len: fullText.length,
                duration,
                ease: 'none',
                onUpdate: () => {
                  target.textContent = fullText.slice(0, Math.ceil(proxy.len));
                }
              }, enterTime);
              break;
            }
            case 'drawSVG': {
              const paths = el.querySelectorAll('path, line, rect, circle, polyline, ellipse');
              masterTl.set(el, { opacity: 1 }, enterTime);
              paths.forEach(path => {
                let len = 200;
                try { len = path.getTotalLength() || 200; } catch (_) {}
                masterTl.fromTo(path,
                  { strokeDasharray: len, strokeDashoffset: len },
                  { strokeDashoffset: 0, duration, ease },
                  enterTime
                );
              });
              break;
            }
            default:
              masterTl.fromTo(el, { opacity: 0 }, { opacity: 1, duration, ease }, enterTime);
          }

          // Wire Exit animation onto master timeline (either explicit exit or scene end)
          const exitTime = elDef.animation?.exit?.at != null ? elDef.animation.exit.at : (sceneEnd - 0.35);
          if (exitTime > enterTime) {
            masterTl.to(el, { opacity: 0, duration: 0.35, ease: 'power1.in' }, exitTime);
          }
        });
      });
    }
  };

  root.SceneRenderer = SceneRenderer;
  root.SceneTimeline = SceneTimeline;

})(window);
