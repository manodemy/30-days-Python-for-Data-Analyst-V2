/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Animator Effects Library (v3.5 Luminous Light Studio)
   GSAP 3.x Visual Micro-Animations & Ambient Canvas Particles
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  const AnimatorEffects = {
    // ── Typewriter Text Reveal ──
    typewriter(element, fullText, duration = 2.0) {
      if (!element) return;
      element.textContent = '';
      const chars = fullText.split('');
      const interval = (duration * 1000) / Math.max(chars.length, 1);
      
      let i = 0;
      const timer = setInterval(() => {
        if (i < chars.length) {
          element.textContent += chars[i];
          i++;
        } else {
          clearInterval(timer);
        }
      }, interval);

      return {
        cancel: () => clearInterval(timer),
        finish: () => {
          clearInterval(timer);
          element.textContent = fullText;
        }
      };
    },

    // ── Draw SVG Path via strokeDashoffset ──
    drawSVGPath(timeline, pathSelector, duration = 1.0, position = "+=0") {
      if (!window.gsap) return;
      timeline.fromTo(pathSelector, 
        { strokeDashoffset: 100, opacity: 0 },
        { strokeDashoffset: 0, opacity: 1, duration, ease: "power2.inOut" },
        position
      );
    },

    // ── Staggered Card Entrances ──
    staggerCards(timeline, cardSelector, stagger = 0.18, position = "+=0") {
      if (!window.gsap) return;
      timeline.fromTo(cardSelector,
        { y: 16, opacity: 0.7, scale: 0.98 },
        { y: 0, opacity: 1, scale: 1, duration: 0.5, stagger, ease: "power2.out" },
        position
      );
    },

    // ── Spotlight / Highlight Glow ──
    spotlight(timeline, elementSelector, glowColor = "rgba(99, 102, 241, 0.25)", position = "+=0") {
      if (!window.gsap) return;
      timeline.to(elementSelector, {
        boxShadow: `0 8px 24px ${glowColor}`,
        borderColor: "#4f46e5",
        scale: 1.02,
        duration: 0.35,
        ease: "power1.out"
      }, position);
    },

    // ── Ambient Background Canvas Particle Simulator (Light Studio Palette) ──
    initAmbientBackground(canvas) {
      if (!canvas) return;
      const ctx = canvas.getContext('2d');
      let animationFrame;
      let width = (canvas.width = canvas.offsetWidth || 800);
      let height = (canvas.height = canvas.offsetHeight || 500);

      const colors = [
        'rgba(99, 102, 241, ',  // Indigo
        'rgba(16, 185, 129, ',  // Emerald
        'rgba(14, 165, 233, ',  // Sky
        'rgba(244, 63, 94, '   // Rose
      ];

      const particles = Array.from({ length: 36 }, () => ({
        x: Math.random() * width,
        y: Math.random() * height,
        radius: Math.random() * 2.2 + 0.8,
        vx: (Math.random() - 0.5) * 0.25,
        vy: (Math.random() - 0.5) * 0.25,
        colorPrefix: colors[Math.floor(Math.random() * colors.length)],
        alpha: Math.random() * 0.35 + 0.15
      }));

      function render() {
        ctx.clearRect(0, 0, width, height);
        particles.forEach(p => {
          p.x += p.vx;
          p.y += p.vy;
          if (p.x < 0) p.x = width;
          if (p.x > width) p.x = 0;
          if (p.y < 0) p.y = height;
          if (p.y > height) p.y = 0;

          ctx.beginPath();
          ctx.arc(p.x, p.y, p.radius, 0, Math.PI * 2);
          ctx.fillStyle = `${p.colorPrefix}${p.alpha})`;
          ctx.fill();
        });
        animationFrame = requestAnimationFrame(render);
      }

      render();

      return {
        destroy: () => cancelAnimationFrame(animationFrame),
        resize: (w, h) => {
          width = canvas.width = w;
          height = canvas.height = h;
        }
      };
    }
  };

  root.AnimatorEffects = AnimatorEffects;
})(window);
