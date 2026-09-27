/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Full-Bleed Animator Runtime Engine (v3.0)
   Coordinates: Full-Bleed Theory Cinema, Audio ↔ GSAP Sync,
   Dynamic Karaoke Subtitles, Background Tab Guard & Autoplay
   SceneRenderer bridge: JSON-driven scenes auto-routed
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  class RagAnimatorEngine {
    constructor(options = {}) {
      this.containerId = options.containerId || 'panelRight';
      this.currentSlideIndex = 0;
      this.timeline = null;
      this.isPlaying = false;
      this.activeAudio = null;
      this.ambientFx = null;
      this.playbackRate = 1.0;
      this.isMuted = false;
      this.autoplayNext = true;
      this.timestamps = null;
      this.audioBaseDir = '/Version-3/RAG-Day01';
      this.sceneRenderer = null; // SceneRenderer instance (for JSON-driven slides)
      this.rag3dInstance = null; // Persistent Rag3DRenderer instance

      this.initVisibilityGuard();
      this.initKeyboardShortcuts();
      this.initDropdownListeners();
    }

    registerDayAnimations(animationsData) {
      this.animationsData = animationsData;
    }

    setTimestamps(timestampsData) {
      this.timestamps = timestampsData;
    }

    // ── Background Tab Visibility Guard (Prevents Desync) ──
    initVisibilityGuard() {
      document.addEventListener('visibilitychange', () => {
        if (document.hidden) {
          if (this.isPlaying) {
            this.pause();
            this.wasPlayingBeforeTabHidden = true;
          }
        } else {
          if (this.wasPlayingBeforeTabHidden) {
            this.wasPlayingBeforeTabHidden = false;
            // Align timeline with audio position
            if (this.activeAudio && this.timeline) {
              this.timeline.seek(this.activeAudio.currentTime);
            }
          }
        }
      });
    }

    // ── Dropdown Event Listeners (Close on Outside Click or Esc) ──
    initDropdownListeners() {
      document.addEventListener('click', (e) => {
        const wrap = document.getElementById('cinemaTopicDropdownWrap');
        if (wrap && !wrap.contains(e.target)) {
          this.closeSlideDropdown();
        }
      });
      window.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
          this.closeSlideDropdown();
        }
      });
    }

    // ── Studio Keyboard Shortcuts (Space, Seek, Mute) ──
    initKeyboardShortcuts() {
      window.addEventListener('keydown', (e) => {
        // Ignore if focus is in CodeMirror, an input, or textarea
        if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA' || e.target.closest('.CodeMirror')) {
          return;
        }

        if (e.code === 'Space') {
          e.preventDefault();
          this.togglePlay();
        } else if (e.code === 'ArrowLeft') {
          e.preventDefault();
          this.seekRelative(-5);
        } else if (e.code === 'ArrowRight') {
          e.preventDefault();
          this.seekRelative(5);
        } else if (e.code === 'KeyM') {
          e.preventDefault();
          this.toggleMute();
        }
      });
    }

    // ── Mount the Full-Bleed Cinema Stage directly into panel ──
    mount(slideIndex = 0) {
      this.currentSlideIndex = slideIndex;
      const container = document.getElementById(this.containerId);
      if (!container) return;

      container.innerHTML = `
        <div class="rag-animation-stage" id="ragAnimStage">
          <!-- Ambient Particle Background -->
          <canvas class="rag-anim-ambient-canvas" id="ragAnimCanvas"></canvas>

          <!-- Top Cinema Header Bar (Clean Light Studio) -->
          <div class="cinema-header-bar">
            <div class="cinema-header-left">
              <div class="cinema-topic-dropdown-wrap" id="cinemaTopicDropdownWrap">
                <button class="cinema-topic-dropdown-btn" id="cinemaTopicDropdownBtn" aria-expanded="false" aria-haspopup="true" title="Click to view all slides" onclick="window.ragAnimator && window.ragAnimator.toggleSlideDropdown(event)">
                  <span id="cinemaTopicTag" class="cinema-topic-tag">SLIDE 01</span>
                  <span id="cinemaSlideTitle" class="cinema-title-text" title="01. How LLMs Actually Think (And Why They Hallucinate)">How LLMs Actually Think (And Why They Hallucinate)</span>
                  <svg class="cinema-dropdown-chevron" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="6 9 12 15 18 9"></polyline>
                  </svg>
                </button>
                <div class="cinema-dropdown-menu" id="cinemaDropdownMenu" role="menu"></div>
              </div>
            </div>

            <div class="cinema-header-right">
              <button id="autoplayToggleBtn" class="cinema-autoplay-btn is-active" onclick="window.ragAnimator && window.ragAnimator.toggleAutoplay()" title="Toggle Auto-advance slides">
                <span class="autoplay-dot"></span>
                <span class="autoplay-label">Autoplay</span>
                <span class="autoplay-status-text">ON</span>
              </button>
              <div class="cinema-nav-group">
                <button class="cinema-nav-btn" onclick="window.prevSlide()" title="Previous slide">
                  <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
                  <span>Prev</span>
                </button>
                <div class="cinema-nav-divider"></div>
                <button class="cinema-nav-btn" onclick="window.nextSlide()" title="Next slide">
                  <span>Next</span>
                  <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                </button>
              </div>
            </div>
          </div>

          <!-- Dynamic Scene Viewport -->
          <div class="rag-theory-viewport" style="position: relative; flex: 1; min-height: 0; overflow: hidden; background: #f8fafc;">
            <!-- Topic 1 Thumbnail Poster Cover (Shown when paused at start, eliminates blank screen) -->
            <div id="ragThumbnailCover" class="rag-thumbnail-cover" title="Click to Start Topic 1">
              <img class="rag-thumb-bg" src="/Version-3/rag-content/assets/slide01_thumbnail.jpg" alt="Topic 1: How LLMs Think & Why They Hallucinate" />
              <div class="rag-thumb-overlay">
                <div class="rag-thumb-center">
                  <button id="ragThumbPlayBtn" class="rag-thumb-play-btn" title="Start Lesson">
                    <svg viewBox="0 0 24 24" fill="currentColor" width="30" height="30" style="transform: translateX(2px);"><path d="M8 5v14l11-7z"/></svg>
                  </button>
                  <span class="rag-thumb-play-label">Click to Start Topic 1</span>
                </div>
              </div>
            </div>

            <!-- Cinematic Visual Layer (3D Artwork spanning 100% width of theory screen, grounded to bottom) -->
            <div id="ragCinemaVisualLayer" style="position: absolute; inset: 0; z-index: 1; pointer-events: none; overflow: hidden; display: flex; align-items: flex-end; justify-content: center; width: 100%;">
              <img id="ragImg1" src="/Version-3/rag-content/assets/slide01_image1_blackbox.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 1; will-change: transform, opacity;" />
              <img id="ragImg2" src="/Version-3/rag-content/assets/slide01_image2_room_filing_cabinet.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <img id="ragImg3" src="/Version-3/rag-content/assets/slide01_locked_room.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <img id="ragImg4" src="/Version-3/rag-content/assets/slide01_image4_parametric_memory.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <img id="ragImg5" src="/Version-3/rag-content/assets/slide01_door_opens.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <img id="ragImgSlide2" src="/Version-3/rag-content/assets/slide02_5stage_conveyor.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <img id="ragImgS3Crisis" src="/Version-3/rag-content/assets/slide03_humiliation_incident.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <img id="ragImgS3Success" src="/Version-3/rag-content/assets/slide03_notebook_success.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <img id="ragImgS3Diagnostics" src="/Version-3/rag-content/assets/slide03_3bugs_diagnostics.jpg" style="position: absolute; bottom: 0; left: 0; width: 100%; height: 70%; object-fit: cover; object-position: center bottom; transform-origin: center bottom; opacity: 0; will-change: transform, opacity;" />
              <div id="ragS3MorphFlash" style="position: absolute; inset: 0; background: radial-gradient(circle at 45% 55%, rgba(255, 255, 255, 0.75), rgba(255, 255, 255, 0.1) 60%, transparent 80%); opacity: 0; pointer-events: none; mix-blend-mode: overlay; z-index: 5;"></div>
            </div>

            <!-- Kinetic Micro-Animation Overlays (Laser Beams, Token Simulator, Radar Rings, Flying Docs) -->
            <div id="ragKineticLayer" style="position: absolute; inset: 0; z-index: 2; pointer-events: none; overflow: hidden;"></div>

            <!-- 2D HUD / Typography / Dynamic Cards Layer -->
            <div class="rag-anim-scene" id="ragAnimSceneArea" style="position: absolute; inset: 0; z-index: 3; pointer-events: none; background: transparent;">
              <!-- Dynamic elements mounted by GSAP Timeline -->
            </div>
          </div>

          <!-- Flush Bottom Cinema Player Controls -->
          <div class="rag-anim-controls">
            <button class="rag-anim-play-btn" id="ragAnimPlayBtn" title="Play/Pause (Space)">
              <span id="ragPlayIcon">▶</span>
            </button>
            <span class="rag-anim-time-label" id="ragAnimTimeLabel">0:00 / 0:00</span>
            <div class="rag-anim-scrubber-track" id="ragAnimScrubber">
              <div class="rag-anim-scrubber-fill" id="ragScrubberFill"></div>
              <div class="rag-anim-scrubber-thumb" id="ragScrubberThumb"></div>
            </div>
            <select class="rag-anim-speed-select" id="ragAnimSpeed" title="Playback Speed">
              <option value="1">1.0x</option>
              <option value="1.25">1.25x</option>
              <option value="1.5">1.5x</option>
            </select>
          </div>
        </div>
      `;

      // Init Ambient Particle Canvas
      const canvas = document.getElementById('ragAnimCanvas');
      if (canvas && root.AnimatorEffects) {
        this.ambientFx = root.AnimatorEffects.initAmbientBackground(canvas);
      }

      // Init 3D WebGL Layer
      this.initRag3DLayer();

      this.bindControls();
      this.loadSlideAnimation(slideIndex);
    }

    initRag3DLayer() {
      if (this.rag3dInstance) return this.rag3dInstance;
      const containerEl = document.getElementById('rag3dSceneArea');
      if (!containerEl || !root.Rag3DRenderer) return null;
      try {
        this.rag3dInstance = new root.Rag3DRenderer(containerEl, {
          enableBloom: false,
          enableShadows: true,
          pixelRatioCap: 2
        });
      } catch (err) {
        console.warn('[AnimatorEngine] Could not initialize Rag3DRenderer:', err);
      }
      return this.rag3dInstance;
    }

    bindControls() {
      const playBtn = document.getElementById('ragAnimPlayBtn');
      const scrubber = document.getElementById('ragAnimScrubber');
      const speedSelect = document.getElementById('ragAnimSpeed');

      if (playBtn) {
        playBtn.onclick = () => this.togglePlay();
      }

      if (speedSelect) {
        speedSelect.value = String(this.playbackRate);
        speedSelect.onchange = (e) => {
          this.playbackRate = parseFloat(e.target.value) || 1.0;
          if (this.timeline) this.timeline.timeScale(this.playbackRate);
          if (this.activeAudio) this.activeAudio.playbackRate = this.playbackRate;
        };
      }

      if (scrubber) {
        let isDragging = false;
        const handleScrub = (e) => {
          const rect = scrubber.getBoundingClientRect();
          const pos = Math.max(0, Math.min(1, (e.clientX - rect.left) / rect.width));
          const dur = this.getDuration();
          if (dur > 0) {
            const seekTime = pos * dur;
            this.seek(seekTime);
          }
        };

        scrubber.onmousedown = (e) => {
          isDragging = true;
          handleScrub(e);
        };

        window.addEventListener('mousemove', (e) => {
          if (isDragging) handleScrub(e);
        });

        window.addEventListener('mouseup', () => {
          isDragging = false;
        });
      }

      // Thumbnail Click to Play
      const thumbCover = document.getElementById('ragThumbnailCover');
      if (thumbCover) {
        thumbCover.onclick = () => {
          this.hideThumbnail();
          this.play();
        };
      }
    }

    showThumbnail() {
      const thumb = document.getElementById('ragThumbnailCover');
      if (thumb && this.currentSlideIndex === 0) {
        thumb.classList.remove('hidden');
      }
    }

    hideThumbnail() {
      const thumb = document.getElementById('ragThumbnailCover');
      if (thumb) {
        thumb.classList.add('hidden');
      }
    }

    getDuration() {
      if (this.activeAudio && !isNaN(this.activeAudio.duration) && this.activeAudio.duration > 0) {
        return this.activeAudio.duration;
      }
      if (this.timeline) return this.timeline.duration();
      return 0;
    }

    // ── Load & Author Timeline for Current Slide ──
    loadSlideAnimation(slideIndex) {
      this.pause();

      if (this.timeline) {
        this.timeline.kill();
        this.timeline = null;
      }

      // Destroy previous SceneRenderer if any
      if (this.sceneRenderer) {
        this.sceneRenderer.destroy();
        this.sceneRenderer = null;
      }
      // Teardown active 3D scene from previous slide
      if (this.rag3dInstance) {
        this.rag3dInstance.teardownActiveScene();
      }

      const sceneArea = document.getElementById('ragAnimSceneArea');
      if (!sceneArea) return;

      const slideConfig = this.animationsData?.[slideIndex];
      if (!slideConfig) {
        sceneArea.innerHTML = `<div style="color: #94a3b8; padding: 20px;">Animation ready. Click play to start.</div>`;
        return;
      }

      // Update slide title & counter
      const titleEl   = document.getElementById('cinemaSlideTitle');
      const counterEl = document.getElementById('cinemaSlideCounter');
      const topicTag  = document.getElementById('cinemaTopicTag');

      if (titleEl) {
        const fullTitle = slideConfig.title || `Slide ${slideIndex + 1}`;
        const cleanTitle = fullTitle.replace(/^\d+[\.\:\-]\s*/, '');
        titleEl.textContent = cleanTitle;
        titleEl.title = fullTitle;
      }
      if (topicTag) {
        topicTag.textContent = `SLIDE 0${slideIndex + 1}`;
      }
      if (counterEl) {
        counterEl.textContent = `Slide ${slideIndex + 1} of ${this.animationsData?.length || 5}`;
      }

      // Keep slide dropdown menu in sync
      this.populateSlideDropdown(slideIndex);

      // Thumbnail visibility for Slide 1
      if (slideIndex === 0) {
        this.showThumbnail();
      } else {
        this.hideThumbnail();
      }

      // ── Route: JSON-driven (sceneJson) vs legacy (buildTimeline) ──
      const useSceneRenderer = Array.isArray(slideConfig.sceneJson);

      if (useSceneRenderer) {
        // SceneRenderer path: sceneArea is the % canvas host
        sceneArea.innerHTML = '';
        sceneArea.style.position = 'absolute';
        sceneArea.style.inset = '0';
        sceneArea.style.width = '100%';
        sceneArea.style.height = '100%';
        sceneArea.style.overflow = 'hidden';
        sceneArea.style.padding = '0';
        sceneArea.style.pointerEvents = 'none';
      } else {
        // Legacy path: insert initialHtml for buildTimeline to manipulate
        sceneArea.innerHTML = slideConfig.initialHtml || '';
        sceneArea.style.position = 'relative';
        sceneArea.style.padding  = '24px 32px';
      }

      // Initialize Audio Track for Slide
      const slideNumStr  = String(slideIndex + 1).padStart(2, '0');
      const audioFileName = `RAG_Day01_Slide${slideNumStr}.mp3`;
      this.activeAudio = new Audio(`${this.audioBaseDir}/${audioFileName}?v=narration_v8_${slideNumStr}`);
      this.activeAudio.playbackRate    = this.playbackRate;
      this.activeAudio.muted           = this.isMuted;
      this.activeAudio.preservesPitch  = true;

      // Audio timeupdate → scrubber + karaoke
      this.activeAudio.ontimeupdate = () => {
        if (this.activeAudio && this.timeline) {
          const cur = this.activeAudio.currentTime;
          const dur = this.getDuration();
          this.updateScrubberUI(cur, dur);
          this.updateKaraokeCaptions(audioFileName, cur);
          if (this.currentSlideIndex === 1 && root.Slide02KineticOverlay) {
            root.Slide02KineticOverlay.syncToTime(cur);
          }
          if (this.currentSlideIndex === 2 && root.Slide03KineticOverlay) {
            root.Slide03KineticOverlay.syncToTime(cur);
          }
          // Sync GSAP timeline to audio position (master sync)
          if (Math.abs(this.timeline.time() - cur) > 0.25) {
            this.timeline.seek(cur, false);
          }
        }
      };

      this.activeAudio.onended = () => {
        this.isPlaying = false;
        this.updatePlayBtnUI();
        this.setEqualizerSpeaking(false);
        if (this.autoplayNext && this.currentSlideIndex < (this.animationsData?.length || 5) - 1) {
          setTimeout(() => { if (window.nextSlide) window.nextSlide(); }, 1200);
        }
      };

      if (!window.gsap) {
        console.warn('GSAP 3 not detected. Static fallback mode.');
        return;
      }

      // Build master GSAP timeline
      this.timeline = gsap.timeline({
        paused: true,
        onUpdate: () => {
          if (!this.activeAudio) {
            const cur = this.timeline.time();
            const dur = this.timeline.duration();
            this.updateScrubberUI(cur, dur);
          }
        }
      });

      if (useSceneRenderer) {
        // ── SceneRenderer path ──
        if (!root.SceneRenderer || !root.SceneTimeline) {
          console.error('SceneRenderer not loaded. Add scene-renderer.js before animator-engine.js.');
          return;
        }
        this.sceneRenderer = new root.SceneRenderer(sceneArea);
        root.SceneTimeline.buildFromSceneJson(
          slideConfig.sceneJson,
          this.timeline,
          this.sceneRenderer
        );
        // ── Cinematic Artwork Animation (Single Continuous Camera Move from 10.5s to 71.5s) ──
        const visualLayer = document.getElementById('ragCinemaVisualLayer');
        const img1 = document.getElementById('ragImg1');
        const img2 = document.getElementById('ragImg2');
        const img3 = document.getElementById('ragImg3');
        const img4 = document.getElementById('ragImg4');
        const img5 = document.getElementById('ragImg5');
        const imgS2 = document.getElementById('ragImgSlide2');

        if (slideIndex === 0) {
          if (visualLayer) visualLayer.style.display = 'flex';
          if (imgS2) this.timeline.set(imgS2, { opacity: 0 }, 0.0);

          // Reset initial states at t=0
          if (img1) this.timeline.set(img1, { opacity: 0, scale: 0.76, x: 0, y: 0 }, 0.0);
          if (img2) this.timeline.set(img2, { opacity: 0, scale: 1.0, x: 0, y: 0 }, 0.0);
          if (img3) this.timeline.set(img3, { opacity: 0, scale: 1.025, x: -3, y: 0 }, 0.0);
          if (img4) this.timeline.set(img4, { opacity: 0, scale: 1.050, x: -7, y: 0 }, 0.0);
          if (img5) this.timeline.set(img5, { opacity: 0, scale: 1.040, x: -8, y: 0 }, 0.0);

          // ── Beat 1, 2, 3: The Black Box Cold-Open & Predictor (0.0s -> 14.0s) ──
          // Dramatic zoom in at cold open, picture stays continuously active until 14.0s
          if (img1) {
            this.timeline.fromTo(img1,
              { opacity: 0, scale: 0.76 },
              { opacity: 1, scale: 1.0, duration: 1.8, ease: 'power3.out' },
              0.0
            );
            this.timeline.to(img1, { scale: 1.04, x: -6, duration: 12.2, ease: 'none' }, 1.8);
            this.timeline.to(img1, { opacity: 0, duration: 0.6, ease: 'power2.inOut' }, 14.0);
          }

          // ── Beat 3: Locked Room with Closed Door (14.0s -> 22.16s) ──
          // Cinematic camera push on closed futuristic room
          if (img3) {
            this.timeline.fromTo(img3, { opacity: 0, scale: 0.95, x: 0 }, { opacity: 1, scale: 1.025, duration: 1.0, ease: 'power2.out' }, 14.0);
            this.timeline.to(img3, { scale: 1.050, x: -4, duration: 7.16, ease: 'none' }, 15.0);
            this.timeline.to(img3, { opacity: 0, duration: 0.8, ease: 'power2.inOut' }, 22.16);
          }

          // ── Beat 4 to Beat 7: Parametric Memory & The 3 Flaws (22.16s -> 58.80s) ──
          // Smooth crossfade to room image with glowing neural orb at 22.16s, active through all 3 flaws
          if (img4) {
            this.timeline.fromTo(img4, { opacity: 0, scale: 1.025, x: -3 }, { opacity: 1, scale: 1.050, duration: 0.8, ease: 'power2.inOut' }, 22.16);
            this.timeline.to(img4, { scale: 1.085, x: -12, duration: 35.84, ease: 'none' }, 22.96);
            this.timeline.to(img4, { opacity: 0, duration: 0.8, ease: 'power2.inOut' }, 58.80);
          }

          // ── Beat 8 to Beat 11: Door Opens & Documents Flying (58.80s -> 79.44s) ──
          // Smooth crossfade to open door with golden sunlight flood and flying documents
          if (img5) {
            this.timeline.to(img5, { opacity: 1, duration: 0.8, ease: 'power2.inOut' }, 58.80);
            this.timeline.fromTo(img5, { scale: 1.040, x: -8 }, { scale: 1.085, x: -15, duration: 20.64, ease: 'none' }, 58.80);
          }

          // ── Mount Slide 01 Kinetic Motion Overlay (Interactive Laser Beams, Token Simulator, Radar Rings, Flying Docs) ──
          const kineticLayer = document.getElementById('ragKineticLayer');
          if (kineticLayer && typeof root.mountSlide01KineticOverlay === 'function') {
            root.mountSlide01KineticOverlay(kineticLayer, this.timeline);
          }
        } else if (slideIndex === 1) {
          if (visualLayer) visualLayer.style.display = 'flex';

          // Reset Slide 1 images
          if (img1) this.timeline.set(img1, { opacity: 0 }, 0.0);
          if (img2) this.timeline.set(img2, { opacity: 0 }, 0.0);
          if (img3) this.timeline.set(img3, { opacity: 0 }, 0.0);
          if (img4) this.timeline.set(img4, { opacity: 0 }, 0.0);
          if (img5) this.timeline.set(img5, { opacity: 0 }, 0.0);

          // Animate Slide 2 3D 5-Stage Conveyor Artwork
          if (imgS2) {
            this.timeline.fromTo(imgS2,
              { opacity: 0, scale: 0.97, x: 0, y: 0 },
              { opacity: 1, scale: 1.0, duration: 1.0, ease: 'power2.out' },
              0.0
            );
            this.timeline.to(imgS2, { scale: 1.04, x: -12, duration: 62.0, ease: 'none' }, 1.0);
          }

          // Mount Slide 02 Kinetic Motion Overlay
          const kineticLayer = document.getElementById('ragKineticLayer');
          if (kineticLayer && typeof root.mountSlide02KineticOverlay === 'function') {
            root.mountSlide02KineticOverlay(kineticLayer, this.timeline);
          }
        } else if (slideIndex === 2) {
          if (visualLayer) visualLayer.style.display = 'flex';

          // Reset Slide 1 & Slide 2 images
          if (img1) this.timeline.set(img1, { opacity: 0 }, 0.0);
          if (img2) this.timeline.set(img2, { opacity: 0 }, 0.0);
          if (img3) this.timeline.set(img3, { opacity: 0 }, 0.0);
          if (img4) this.timeline.set(img4, { opacity: 0 }, 0.0);
          if (img5) this.timeline.set(img5, { opacity: 0 }, 0.0);
          if (imgS2) this.timeline.set(imgS2, { opacity: 0 }, 0.0);

          const imgS3Crisis = document.getElementById('ragImgS3Crisis');
          const imgS3Success = document.getElementById('ragImgS3Success');
          const imgS3Diag = document.getElementById('ragImgS3Diagnostics');
          const morphFlash = document.getElementById('ragS3MorphFlash');

          // Initialize states at t=0
          if (imgS3Crisis) this.timeline.set(imgS3Crisis, { opacity: 1, scale: 1.0, x: 0, filter: 'blur(0px)' }, 0.0);
          if (imgS3Success) this.timeline.set(imgS3Success, { opacity: 0, scale: 1.0, x: 0, filter: 'blur(0px)' }, 0.0);
          if (imgS3Diag) this.timeline.set(imgS3Diag, { opacity: 0, scale: 0.96, x: 0, filter: 'blur(0px)' }, 0.0);
          if (morphFlash) this.timeline.set(morphFlash, { opacity: 0 }, 0.0);

          // Subtle Ken Burns slow pan for Beat 1 (Crisis: 0s -> 14.5s)
          if (imgS3Crisis) {
            this.timeline.to(imgS3Crisis, { scale: 1.035, x: -6, duration: 14.5, ease: 'sine.out' }, 0.0);
          }

          // ── Beat 2: Seamless Optical Morph Dissolve to Flashback (14.5s -> 25.5s) ──
          // Matched scale/pan + subtle lens blur + soft memory bloom
          if (imgS3Crisis && imgS3Success) {
            this.timeline.to(imgS3Crisis, { 
              opacity: 0, 
              scale: 1.05, 
              x: -8, 
              filter: 'blur(4px)', 
              duration: 1.2, 
              ease: 'power2.inOut' 
            }, 14.5);

            this.timeline.fromTo(imgS3Success,
              { opacity: 0, scale: 1.02, x: -4, filter: 'blur(5px)' },
              { opacity: 1, scale: 1.035, x: -6, filter: 'blur(0px)', duration: 1.2, ease: 'power2.inOut' },
              14.5
            );

            if (morphFlash) {
              this.timeline.fromTo(morphFlash,
                { opacity: 0 },
                { opacity: 0.45, duration: 0.5, ease: 'power1.out' },
                14.65
              );
              this.timeline.to(morphFlash, { opacity: 0, duration: 0.6, ease: 'power2.in' }, 15.15);
            }

            // Continuous camera drift during notebook flashback (15.7s -> 25.5s)
            this.timeline.to(imgS3Success, { scale: 1.06, x: -12, duration: 9.8, ease: 'sine.out' }, 15.7);
          }

          // ── Beat 3: Morph Snap-Back to Reality (25.5s -> 73.5s) ──
          // Smooth optical morph back to crisis reality
          if (imgS3Success && imgS3Crisis) {
            this.timeline.to(imgS3Success, { 
              opacity: 0, 
              scale: 1.08, 
              x: -14, 
              filter: 'blur(4px)', 
              duration: 1.2, 
              ease: 'power2.inOut' 
            }, 25.5);

            this.timeline.fromTo(imgS3Crisis,
              { opacity: 0, scale: 1.04, x: -8, filter: 'blur(5px)' },
              { opacity: 1, scale: 1.05, x: -10, filter: 'blur(0px)', duration: 1.2, ease: 'power2.inOut' },
              25.5
            );

            if (morphFlash) {
              this.timeline.fromTo(morphFlash,
                { opacity: 0 },
                { opacity: 0.35, duration: 0.4, ease: 'power1.out' },
                25.6
              );
              this.timeline.to(morphFlash, { opacity: 0, duration: 0.5, ease: 'power2.in' }, 26.0);
            }

            // Crisis drift until diagnostic phase (26.7s -> 73.5s)
            this.timeline.to(imgS3Crisis, { scale: 1.09, x: -18, duration: 46.8, ease: 'none' }, 26.7);
          }

          // ── Beats 7-10: Morph into 3D Diagnostic Laboratory (73.5s -> 131.10s) ──
          if (imgS3Crisis && imgS3Diag) {
            this.timeline.to(imgS3Crisis, { 
              opacity: 0, 
              scale: 1.12, 
              x: -22, 
              filter: 'blur(6px)', 
              duration: 1.5, 
              ease: 'power2.inOut' 
            }, 73.5);

            this.timeline.fromTo(imgS3Diag,
              { opacity: 0, scale: 0.95, filter: 'blur(6px)' },
              { opacity: 1, scale: 1.0, filter: 'blur(0px)', duration: 1.5, ease: 'power2.inOut' },
              73.5
            );

            this.timeline.to(imgS3Diag, { scale: 1.05, x: -12, duration: 56.1, ease: 'none' }, 75.0);
          }

          // Mount Slide 03 Kinetic Motion Overlay
          const kineticLayer = document.getElementById('ragKineticLayer');
          if (kineticLayer && typeof root.mountSlide03KineticOverlay === 'function') {
            root.mountSlide03KineticOverlay(kineticLayer, this.timeline);
          }
        } else {
          if (visualLayer) visualLayer.style.display = 'none';
          const kineticLayer = document.getElementById('ragKineticLayer');
          if (kineticLayer) kineticLayer.innerHTML = '';
        }

        // Dummy tail call so timeline has nonzero duration
        const lastScene = slideConfig.sceneJson[slideConfig.sceneJson.length - 1];
        const totalDur  = lastScene ? (lastScene.endAt || lastScene.startAt + 8) : 60;
        this.timeline.to({}, { duration: 0.01 }, totalDur);
      } else {
        // ── Legacy buildTimeline path ──
        slideConfig.buildTimeline(this.timeline, sceneArea);
      }

      this.timeline.timeScale(this.playbackRate);
      this.updateScrubberUI(0, this.getDuration());
      this.updatePlayBtnUI();
    }

    // ── Karaoke Dynamic Subtitle Highlighting ──
    updateKaraokeCaptions(audioFileName, currentTime) {
      if (!this.timestamps) return;
      const fileData = this.timestamps[audioFileName];
      if (!fileData || !fileData.words) return;

      const words = fileData.words;
      // Find current word
      const curWordIdx = words.findIndex(w => currentTime >= w.start && currentTime <= w.end);
      if (curWordIdx !== -1) {
        // Highlight active word in caption box if rendered with words
        const captionText = document.querySelector('.rag-caption-box #s' + (this.currentSlideIndex + 1) + '-caption-text') ||
                            document.querySelector('.rag-caption-box span:last-child');
        if (captionText && !captionText.dataset.karaokeInit) {
          // Pre-split text into spans once
          const segment = fileData.segments.find(s => currentTime >= s.start && currentTime <= s.end);
          if (segment) {
            captionText.dataset.karaokeInit = "true";
            captionText.innerHTML = segment.text.split(' ').map(w => `<span class="karaoke-word">${w} </span>`).join('');
          }
        }
      }
    }

    togglePlay() {
      if (this.isPlaying) {
        this.pause();
      } else {
        this.play();
      }
    }

    play() {
      this.hideThumbnail();
      if (this.activeAudio) {
        this.activeAudio.play().catch(e => console.warn('Audio play deferred:', e));
      }
      if (this.timeline) {
        if (this.timeline.progress() >= 1) {
          this.timeline.restart();
        } else {
          this.timeline.play();
        }
      }
      this.isPlaying = true;
      this.updatePlayBtnUI();
      this.setEqualizerSpeaking(true);
    }

    pause() {
      if (this.activeAudio) {
        this.activeAudio.pause();
      }
      if (this.timeline) {
        this.timeline.pause();
      }
      this.isPlaying = false;
      this.updatePlayBtnUI();
      this.setEqualizerSpeaking(false);
    }

    seek(timeInSeconds) {
      const dur = this.getDuration();
      const clamped = Math.max(0, Math.min(dur, timeInSeconds));
      if (clamped > 0.4) {
        this.hideThumbnail();
      } else if (clamped <= 0.1 && !this.isPlaying && this.currentSlideIndex === 0) {
        this.showThumbnail();
      }
      if (this.activeAudio) {
        this.activeAudio.currentTime = clamped;
      }
      if (this.timeline) {
        this.timeline.seek(clamped);
      }
      if (this.currentSlideIndex === 1 && root.Slide02KineticOverlay) {
        root.Slide02KineticOverlay.syncToTime(clamped);
      }
      if (this.currentSlideIndex === 2 && root.Slide03KineticOverlay) {
        root.Slide03KineticOverlay.syncToTime(clamped);
      }
      this.updateScrubberUI(clamped, dur);
    }

    seekRelative(deltaSeconds) {
      const cur = this.activeAudio ? this.activeAudio.currentTime : (this.timeline ? this.timeline.time() : 0);
      this.seek(cur + deltaSeconds);
    }

    toggleMute() {
      this.isMuted = !this.isMuted;
      if (this.activeAudio) this.activeAudio.muted = this.isMuted;
    }

    toggleAutoplay() {
      this.autoplayNext = !this.autoplayNext;
      const btn = document.getElementById('autoplayToggleBtn');
      if (btn) {
        btn.classList.toggle('is-active', this.autoplayNext);
        const statusSpan = btn.querySelector('.autoplay-status-text');
        if (statusSpan) {
          statusSpan.textContent = this.autoplayNext ? 'ON' : 'OFF';
        } else {
          btn.textContent = `Autoplay: ${this.autoplayNext ? 'ON' : 'OFF'}`;
        }
      }
    }

    setEqualizerSpeaking(isSpeaking) {
      const eq = document.getElementById('voiceEqWrap');
      if (eq) eq.classList.toggle('speaking', isSpeaking);
      const pill = document.getElementById('cinemaVoicePill');
      if (pill) pill.classList.toggle('speaking', isSpeaking);
    }

    updatePlayBtnUI() {
      const icon = document.getElementById('ragPlayIcon');
      if (icon) {
        icon.textContent = this.isPlaying ? '⏸' : '▶';
      }
    }

    updateScrubberUI(currentTime, duration) {
      const fill = document.getElementById('ragScrubberFill');
      const thumb = document.getElementById('ragScrubberThumb');
      const timeLabel = document.getElementById('ragAnimTimeLabel');

      const pct = duration > 0 ? (currentTime / duration) * 100 : 0;
      if (fill) fill.style.width = `${pct}%`;
      if (thumb) thumb.style.left = `${pct}%`;

      if (timeLabel) {
        const curM = Math.floor(currentTime / 60);
        const curS = Math.floor(currentTime % 60).toString().padStart(2, '0');
        const durM = Math.floor(duration / 60);
        const durS = Math.floor(duration % 60).toString().padStart(2, '0');
        timeLabel.textContent = `${curM}:${curS} / ${durM}:${durS}`;
      }
    }

    // ── Interactive Slide Picker Dropdown Handlers ──
    toggleSlideDropdown(e) {
      if (e) e.stopPropagation();
      const wrap = document.getElementById('cinemaTopicDropdownWrap');
      const btn = document.getElementById('cinemaTopicDropdownBtn');
      if (!wrap) return;
      const isOpen = wrap.classList.toggle('is-open');
      if (btn) btn.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
      if (isOpen) {
        this.populateSlideDropdown(this.currentSlideIndex || 0);
      }
    }

    closeSlideDropdown() {
      const wrap = document.getElementById('cinemaTopicDropdownWrap');
      const btn = document.getElementById('cinemaTopicDropdownBtn');
      if (wrap) wrap.classList.remove('is-open');
      if (btn) btn.setAttribute('aria-expanded', 'false');
    }

    getSlideDurationFormatted(idx) {
      const fallbackDurations = ['1:19', '1:03', '0:48', '0:40', '0:44'];
      const audioFileName = `RAG_Day01_Slide0${idx + 1}.mp3`;
      if (this.timestamps && this.timestamps[audioFileName]) {
        const words = this.timestamps[audioFileName].words || this.timestamps[audioFileName];
        if (Array.isArray(words) && words.length > 0) {
          const lastWord = words[words.length - 1];
          const totalSec = Math.round(lastWord.end || lastWord[1] || 0);
          if (totalSec > 0) {
            const m = Math.floor(totalSec / 60);
            const s = Math.floor(totalSec % 60).toString().padStart(2, '0');
            return `${m}:${s}`;
          }
        }
      }
      return fallbackDurations[idx] || '1:00';
    }

    populateSlideDropdown(currentIdx = 0) {
      const menu = document.getElementById('cinemaDropdownMenu');
      if (!menu) return;
      const slides = this.animationsData || (window.COURSE_CONTENT && window.COURSE_CONTENT['rag-day01']?.slides) || [];
      if (!slides.length) return;

      menu.innerHTML = slides.map((slide, idx) => {
        const fullTitle = slide.title || `Slide ${idx + 1}`;
        const cleanTitle = fullTitle.replace(/^\d+[\.\:\-]\s*/, '');
        const durationStr = this.getSlideDurationFormatted(idx);
        const isActive = idx === currentIdx;
        return `
          <button class="cinema-dropdown-item ${isActive ? 'is-active' : ''}" onclick="window.ragAnimator && window.ragAnimator.selectSlide(${idx}, event)" role="menuitem">
            <span class="cinema-dropdown-num">0${idx + 1}</span>
            <span class="cinema-dropdown-title" title="${fullTitle}">${cleanTitle}</span>
            <div class="cinema-dropdown-meta">
              <span class="cinema-dropdown-duration"><svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="opacity: 0.7;"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg> ${durationStr}</span>
              ${isActive ? '<span class="cinema-dropdown-check">✓</span>' : '<span style="width: 13px;"></span>'}
            </div>
          </button>
        `;
      }).join('');
    }

    selectSlide(slideIdx, e) {
      if (e) e.stopPropagation();
      this.closeSlideDropdown();
      if (typeof window.loadSlide === 'function') {
        window.loadSlide(slideIdx);
      } else {
        this.mount(slideIdx);
      }
    }
  }

  root.RagAnimatorEngine = RagAnimatorEngine;
})(window);
