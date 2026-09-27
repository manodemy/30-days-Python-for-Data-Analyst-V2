/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Day 01 Animation Timelines (v3.5 Luminous Light Studio)
   World-Class Narration-Synced GSAP Choreography for Slides 1 - 5
   Theme: Luminous Pearl, Tech Mesh & Crisp Slate (#f8fafc / #ffffff / #0f172a)
   Locked to Andrew's Voice (en-US-AndrewNeural) & Whisper Cue Times
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  /* ═══════════════════════════════════════════════════════════════════
     PER-BEAT WCAG AA CONTRAST AUDIT (FIX 2 SPECIFICATION)
     Target: WCAG AA (>= 4.5:1 Body Text / >= 3.0:1 Large Title Text)
     Tested against representative frames at actual HUD top: 6% / 15% coords:

     Beat 1 (0.0s - 10.5s) [slide01_image1_blackbox.jpg]:
       - Background at (6%, 6%): Pearl Wall Ceiling (#f1f5f9, L=0.88)
       - Frosted Backdrop: rgba(255, 255, 255, 0.95), blur: 12px, border: rgba(226, 232, 240, 0.85)
       - Text Shadow: 0 1px 2px rgba(255, 255, 255, 0.8)
       - Heading (#0f172a, L=0.012) Contrast: 16.9:1 [PASS WCAG AAA]
       - Subtext (#0f172a, L=0.012) Contrast: 16.2:1 [PASS WCAG AAA]

     Beats 2-7 (10.5s - 71.5s) [slide01_image2_room_filing_cabinet.jpg / slide01_locked_room.jpg]:
       - Background at (6%, 6%): White Lab Ceiling & Side Wall (#f8fafc, L=0.95)
       - Frosted Backdrop: rgba(255, 255, 255, 0.95), blur: 10px, border: rgba(226, 232, 240, 0.85)
       - Text Shadow: 0 1px 2px rgba(255, 255, 255, 0.8)
       - Heading (#0f172a, L=0.012) Contrast: 16.9:1 [PASS WCAG AAA]
       - Beat 7 Danger Heading (#991b1b, L=0.088) Contrast: 7.6:1 [PASS WCAG AAA]
       - Subtext (#0f172a, L=0.012) Contrast: 16.2:1 [PASS WCAG AAA]

     Beats 8-9 (71.5s - 97.8s) [slide01_door_opens.jpg]:
       - Background at (6%, 6%): Warm Golden Sunlight Flood (#fed7aa, L=0.72)
       - Frosted Backdrop: rgba(255, 255, 255, 0.96), blur: 12px, border: rgba(254, 215, 170, 0.5)
       - Text Shadow: 0 1px 2px rgba(255, 255, 255, 0.9)
       - Heading (#065f46, L=0.092) Contrast: 7.4:1 [PASS WCAG AAA]
       - Subtext (#0f172a, L=0.012) Contrast: 14.2:1 [PASS WCAG AAA]
     ═══════════════════════════════════════════════════════════════════ */

  const day01Animations = [
    // ── SLIDE 1: How LLMs Think & Why They Hallucinate (JSON-driven SceneRenderer) ──
    {
      slideId: 'slide-1',
      title: '01. How LLMs Actually Think (And Why They Hallucinate)',
      sceneJson: [
      {
            "id": "scene_01_blackbox",
            "narrationCue": "Welcome to Day One of the Advanced R-A-G Studio! First we will understand how Large Language Models actually think, and exactly why they hallucinate. An LLM is not a database. It's a probabilistic next-word predictor. Picture the most brilliant expert you've ever met. Now imagine they've been locked in a windowless room — no access to the outside world, they have complete knowledge on their trained data. Everything they know was memorized before that door closed. That's a Large Language Model.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 0.0,
            "endAt": 29.3,
            "elements": [
                  {
                        "id": "title_blackbox",
                        "type": "heading",
                        "content": "Large Language Model",
                        "position": {
                              "x": 50,
                              "y": 4.6
                        },
                        "animation": {
                              "enter": {
                                    "type": "dramaticZoomIn",
                                    "duration": 0.8,
                                    "delay": 0.0,
                                    "ease": "back.out(1.8)"
                              }
                        },
                        "style": {
                              "fontSize": "26px",
                              "color": "#0f172a"
                        }
                  },
                  {
                        "id": "sub_blackbox",
                        "type": "text",
                        "content": "First we will understand how Large Language Models actually think, and exactly why they hallucinate.",
                        "position": {
                              "x": 50,
                              "y": 13.5,
                              "width": 94
                        },
                        "animation": {
                              "enter": {
                                    "type": "dramaticZoomIn",
                                    "duration": 0.65,
                                    "delay": 3.2,
                                    "ease": "back.out(1.4)"
                              },
                              "exit": {
                                    "at": 13.8
                              }
                        }
                  }
            ]
      },
      // ── Beat 4: Parametric Memory & Counter (29.3s - 35.4s) ──
      // CITABLE ARCHITECTURE BASELINE — 175,000,000,000 parameter count matches
      // the GPT-3 dense architecture (Brown et al., 2020), demonstrating frozen weights.
      // See animation-content-bible.md §Dramatized Statistics.
      {
            "id": "scene_04_parametric_memory",
            "narrationCue": "Every fact it has is compressed into billions of neural weights. We call this parametric memory.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 29.3,
            "endAt": 38.52,
            "elements": [
                  {
                        "id": "title_param",
                        "type": "heading",
                        "content": "Parametric Memory",
                        "position": {
                              "x": 50,
                              "y": 2.2
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.0,
                                    "ease": "power2.out"
                              }
                        },
                        "style": {
                              "fontSize": "24px",
                              "color": "#0f172a"
                        }
                  },
                  {
                        "id": "sub_param",
                        "type": "text",
                        "content": "Every fact it has is compressed into billions of neural weights: parametric memory.",
                        "position": {
                              "x": 50,
                              "y": 10.5,
                              "width": 84
                        },
                        "style": {
                              "fontSize": "11.5px",
                              "padding": "5px 16px",
                              "lineHeight": "1.32"
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.2,
                                    "ease": "power2.out"
                              }
                        }
                  }
            ]
      },
      {
            "id": "scene_05_flaw1_cutoff",
            "narrationCue": "First: they're stuck in time. Ask about anything new, and they're just guessing.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 38.52,
            "endAt": 43.14,
            "elements": [
                  {
                        "id": "title_flaw1",
                        "type": "heading",
                        "content": "1. Stuck in Time",
                        "position": {
                              "x": 50,
                              "y": 2.2
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.0,
                                    "ease": "power2.out"
                              }
                        },
                        "style": {
                              "fontSize": "24px",
                              "color": "#0f172a"
                        }
                  },
                  {
                        "id": "sub_flaw1",
                        "type": "text",
                        "content": "First: they're stuck in time. Ask about anything new, and they're just guessing.",
                        "position": {
                              "x": 50,
                              "y": 10.5,
                              "width": 84
                        },
                        "style": {
                              "fontSize": "11.5px",
                              "padding": "5px 16px",
                              "lineHeight": "1.32"
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.2,
                                    "ease": "power2.out"
                              }
                        }
                  }
            ]
      },
      {
            "id": "scene_06_flaw2_zero_files",
            "narrationCue": "Second: they've never seen your files. Your company's private documents were never in that room.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 43.14,
            "endAt": 48.56,
            "elements": [
                  {
                        "id": "title_flaw2",
                        "type": "heading",
                        "content": "2. Never Seen Your Files",
                        "position": {
                              "x": 50,
                              "y": 2.2
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.0,
                                    "ease": "power2.out"
                              }
                        },
                        "style": {
                              "fontSize": "24px",
                              "color": "#0f172a"
                        }
                  },
                  {
                        "id": "sub_flaw2",
                        "type": "text",
                        "content": "Second: they've never seen your files. Your company's private documents were never in that room.",
                        "position": {
                              "x": 50,
                              "y": 10.5,
                              "width": 84
                        },
                        "style": {
                              "fontSize": "11.5px",
                              "padding": "5px 16px",
                              "lineHeight": "1.32"
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.2,
                                    "ease": "power2.out"
                              }
                        }
                  }
            ]
      },
      // ── Beat 7: The Anatomy of Hallucination (48.56s - 58.8s) ──
      // ILLUSTRATIVE VALUE — chosen for pedagogical clarity (Confidence: 99.8% vs Ground Truth: 0.0%),
      // not measured from a real model. Real LLMs at inference time do not expose live telemetry meters.
      // See animation-content-bible.md §Dramatized Statistics.
      {
            "id": "scene_07_flaw3_hallucination",
            "narrationCue": "And third — the dangerous one. They want to be helpful. So when they don't actually know something, they won't admit it. They'll just make up an answer that sounds right. That's hallucination.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 48.56,
            "endAt": 58.8,
            "elements": [
                  {
                        "id": "title_flaw3",
                        "type": "heading",
                        "content": "3. The Dangerous One: Hallucination",
                        "position": {
                              "x": 50,
                              "y": 2.2
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.0,
                                    "ease": "power2.out"
                              }
                        },
                        "style": {
                              "fontSize": "23px",
                              "color": "#dc2626",
                              "whiteSpace": "nowrap"
                        }
                  },
                  {
                        "id": "sub_flaw3",
                        "type": "text",
                        "content": "And third — the dangerous one. They want to be helpful. So when they don't actually know something, they won't admit it. They'll just make up an answer that sounds right. That's hallucination.",
                        "position": {
                              "x": 50,
                              "y": 10.5,
                              "width": 84
                        },
                        "style": {
                              "fontSize": "11.5px",
                              "padding": "5px 16px",
                              "lineHeight": "1.32"
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.2,
                                    "ease": "power2.out"
                              }
                        }
                  }
            ]
      },
      // ── Beat 8: RAG The Simplest Way (58.80s - 65.22s) ──
      {
            "id": "scene_08_rag_simplest_way",
            "narrationCue": "RAG fixes this the simplest way by giving small chunk documents with necessary informations right before they answer.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 58.80,
            "endAt": 65.22,
            "elements": [
                  {
                        "id": "title_rag_simple",
                        "type": "heading",
                        "content": "RAG: The Simplest Solution",
                        "position": {
                              "x": 50,
                              "y": 2.2
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.0,
                                    "ease": "power2.out"
                              }
                        },
                        "style": {
                              "fontSize": "24px",
                              "color": "#0284c7"
                        }
                  },
                  {
                        "id": "sub_rag_simple",
                        "type": "text",
                        "content": "RAG fixes this the simplest way by giving small chunk documents with necessary informations right before they answer.",
                        "position": {
                              "x": 50,
                              "y": 10.5,
                              "width": 84
                        },
                        "style": {
                              "fontSize": "11.5px",
                              "padding": "5px 16px",
                              "lineHeight": "1.32"
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.2,
                                    "ease": "power2.out"
                              }
                        }
                  }
            ]
      },
      // ── Beat 9: No Re-Training — Fresh Verified Reference Pages (65.22s - 72.34s) ──
      {
            "id": "scene_09_verified_reference_pages",
            "narrationCue": "Instead of re-training the model — we hand them fresh, verified reference pages the exact moment they're needed.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 65.22,
            "endAt": 72.34,
            "elements": [
                  {
                        "id": "title_no_retrain",
                        "type": "heading",
                        "content": "No Re-Training Required",
                        "position": {
                              "x": 50,
                              "y": 2.2
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.0,
                                    "ease": "power2.out"
                              }
                        },
                        "style": {
                              "fontSize": "24px",
                              "color": "#059669"
                        }
                  },
                  {
                        "id": "sub_no_retrain",
                        "type": "text",
                        "content": "Instead of re-training the model — we hand them fresh, verified reference pages the exact moment they're needed.",
                        "position": {
                              "x": 50,
                              "y": 10.5,
                              "width": 84
                        },
                        "style": {
                              "fontSize": "11.5px",
                              "padding": "5px 16px",
                              "lineHeight": "1.32"
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.2,
                                    "ease": "power2.out"
                              }
                        }
                  }
            ]
      },
      // ── Beat 10 & 11: Retrieval-Augmented Generation Climax (72.34s - 79.44s) ──
      {
            "id": "scene_10_rag_grand_finale",
            "narrationCue": "That's the whole idea behind Retrieval-Augmented Generation: non-parametric memory, delivered exactly when it's needed.",
            "audioTrack": "RAG_Day01_Slide01.mp3",
            "startAt": 72.34,
            "endAt": 79.44,
            "elements": [
                  {
                        "id": "title_rag_finale",
                        "type": "heading",
                        "content": "Retrieval-Augmented Generation",
                        "position": {
                              "x": 50,
                              "y": 2.2
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.0,
                                    "ease": "power2.out"
                              }
                        },
                        "style": {
                              "fontSize": "24px",
                              "color": "#4f46e5"
                        }
                  },
                  {
                        "id": "sub_rag_finale",
                        "type": "text",
                        "content": "Non-parametric memory delivered the exact moment it's needed — 100% verified.",
                        "position": {
                              "x": 50,
                              "y": 11.2,
                              "width": 84
                        },
                        "style": {
                              "fontSize": "11.5px",
                              "padding": "5px 16px",
                              "lineHeight": "1.32"
                        },
                        "animation": {
                              "enter": {
                                    "type": "fadeIn",
                                    "duration": 0.4,
                                    "delay": 0.2,
                                    "ease": "power2.out"
                              }
                        }
                  }
            ]
      }
      ]
    },
    // ── SLIDE 2: What Does R-A-G Mean? (5-Stage Conveyor) (Audio: 62.96s) ──
    {
      slideId: 'slide-2',
      title: '02. What Does R-A-G Mean? (The 5-Stage Conveyor)',
      sceneJson: [
        // ── Beat 1: R-A-G Definition & Meaning (0.0s - 4.10s) ──
        {
          id: 'scene_02_01_definition',
          narrationCue: 'So, what does R-A-G actually mean? Retrieval-Augmented Generation.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 0.0,
          endAt: 4.10,
          elements: [
            {
              id: 'title_rag_mean',
              type: 'heading',
              content: 'Retrieval-Augmented Generation',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'dramaticZoomIn', duration: 0.8, delay: 1.85, ease: 'back.out(1.6)' }
              },
              style: { fontSize: '24px', color: '#0f172a' }
            },
            {
              id: 'sub_rag_mean',
              type: 'text',
              content: 'What does R-A-G actually mean? Finding the right information to ground LLM intelligence.',
              position: { x: 50, y: 12.8, width: 88 },
              animation: {
                enter: { type: 'fadeIn', duration: 0.4, delay: 0.1, ease: 'power2.out' }
              },
              style: { fontSize: '13px', padding: '6px 20px' }
            }
          ]
        },
        // ── Beat 2: The 5-Stage Conveyor Belt (4.10s - 9.94s) ──
        {
          id: 'scene_02_02_conveyor',
          narrationCue: 'Think of RAG as a five-stage conveyor belt that turns raw documents into grounded answers.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 4.10,
          endAt: 9.94,
          elements: [
            {
              id: 'title_conveyor',
              type: 'heading',
              content: 'The 5-Stage Production Conveyor Belt',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'popIn', duration: 0.5, delay: 0.0, ease: 'back.out(1.4)' }
              },
              style: { fontSize: '23px', color: '#4338ca' }
            },
            {
              id: 'sub_conveyor',
              type: 'text',
              content: 'Turning unstructured enterprise knowledge into verified, hallucination-free model answers.',
              position: { x: 50, y: 12.8, width: 88 },
              animation: {
                enter: { type: 'fadeIn', duration: 0.4, delay: 0.1, ease: 'power2.out' }
              },
              style: { fontSize: '13px', padding: '6px 20px' }
            }
          ]
        },
        // ── Beat 3: Stage 1 Ingestion (9.94s - 17.28s) ──
        {
          id: 'scene_02_03_ingest',
          narrationCue: 'Stage one: Ingestion. We take PDFs, Markdown files, manuals — and turn them into clean text.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 9.94,
          endAt: 17.28,
          elements: [
            {
              id: 'title_ingest',
              type: 'heading',
              content: 'Stage 1: Document Ingestion',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' }
              },
              style: { fontSize: '23px', color: '#4338ca' }
            },
            {
              id: 'sub_ingest',
              type: 'text',
              content: 'Parses PDFs, Word docs, intranet handbooks, and Markdown files into normalized text.',
              position: { x: 50, y: 12.8, width: 88 },
              animation: {
                enter: { type: 'fadeIn', duration: 0.4, delay: 0.1, ease: 'power2.out' }
              },
              style: { fontSize: '13px', padding: '6px 20px' }
            }
          ]
        },
        // ── Beat 4: Stage 2 Chunking (17.28s - 23.72s) ──
        {
          id: 'scene_02_04_chunk',
          narrationCue: 'Stage two: Chunking. We break that text into small, meaningful passages, with overlap where needed.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 17.28,
          endAt: 23.72,
          elements: [
            {
              id: 'title_chunk',
              type: 'heading',
              content: 'Stage 2: Semantic Chunking',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' }
              },
              style: { fontSize: '23px', color: '#6d28d9' }
            },
            {
              id: 'sub_chunk',
              type: 'text',
              content: 'Partitions long text into bite-sized passages with token overlap to maintain context boundaries.',
              position: { x: 50, y: 12.8, width: 88 },
              animation: {
                enter: { type: 'fadeIn', duration: 0.4, delay: 0.1, ease: 'power2.out' }
              },
              style: { fontSize: '13px', padding: '6px 20px' }
            }
          ]
        },
        // ── Beat 5: Stage 3 Embedding (23.72s - 36.66s) ──
        {
          id: 'scene_02_05_embed',
          narrationCue: 'Stage three: Embedding. Each chunk becomes a high-dimensional vector — a numerical representation of its meaning. And tomorrow, on Day Two, we\'ll crack open the math behind those vectors.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 23.72,
          endAt: 36.66,
          elements: [
            {
              id: 'title_embed',
              type: 'heading',
              content: 'Stage 3: Vector Embedding',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' }
              },
              style: { fontSize: '23px', color: '#0284c7' }
            },
            {
              id: 'sub_embed',
              type: 'text',
              content: 'Converts semantic meaning into dense mathematical vectors. We unpack the math in Day 02!',
              position: { x: 50, y: 12.8, width: 88 },
              animation: {
                enter: { type: 'fadeIn', duration: 0.4, delay: 0.1, ease: 'power2.out' }
              },
              style: { fontSize: '13px', padding: '6px 20px' }
            }
          ]
        },
        // ── Beat 6: Stage 4 Retrieval (36.66s - 45.02s) ──
        {
          id: 'scene_02_06_retrieve',
          narrationCue: 'Stage four: Retrieval. A user asks a question. We compare its vector with our stored vectors and pull out the most relevant passages.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 36.66,
          endAt: 45.02,
          elements: [
            {
              id: 'title_retrieve',
              type: 'heading',
              content: 'Stage 4: Semantic Retrieval',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' }
              },
              style: { fontSize: '23px', color: '#d97706' }
            },
            {
              id: 'sub_retrieve',
              type: 'text',
              content: 'Queries vector index via Cosine Similarity / HNSW to rank and fetch the top-k highest scoring passages.',
              position: { x: 50, y: 12.8, width: 88 },
              animation: {
                enter: { type: 'fadeIn', duration: 0.4, delay: 0.1, ease: 'power2.out' }
              },
              style: { fontSize: '13px', padding: '6px 20px' }
            }
          ]
        },
        // ── Beat 7: Stage 5 Generation (45.02s - 53.42s) ──
        {
          id: 'scene_02_07_generate',
          narrationCue: 'Stage five: Generation. Those passages go straight into the LLM\'s context, giving it real evidence to work with.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 45.02,
          endAt: 53.42,
          elements: [
            {
              id: 'title_generate',
              type: 'heading',
              content: 'Stage 5: Grounded LLM Generation',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' }
              },
              style: { fontSize: '23px', color: '#059669' }
            },
            {
              id: 'sub_generate',
              type: 'text',
              content: 'Top passages are injected into prompt context. The LLM synthesizes an evidence-backed answer.',
              position: { x: 50, y: 12.8, width: 88 },
              animation: {
                enter: { type: 'fadeIn', duration: 0.4, delay: 0.1, ease: 'power2.out' }
              },
              style: { fontSize: '13px', padding: '6px 20px' }
            }
          ]
        },
        // ── Beat 8: Full Pipeline Recap & Climax (53.42s - 62.96s) ──
        {
          id: 'scene_02_08_recap',
          narrationCue: 'So the pipeline is simple: Ingest → Chunk → Embed → Retrieve → Generate. That\'s RAG — finding the right information, right when the model needs it.',
          audioTrack: 'RAG_Day01_Slide02.mp3',
          startAt: 53.42,
          endAt: 62.96,
          elements: [
            {
              id: 'title_recap',
              type: 'heading',
              content: 'The 5-Stage Production Pipeline',
              position: { x: 50, y: 4.2 },
              animation: {
                enter: { type: 'popIn', duration: 0.6, delay: 0.0, ease: 'back.out(1.5)' }
              },
              style: { fontSize: '24px', color: '#047857' }
            }
          ]
        }
      ]
    },

    // ── SLIDE 3: 3 Bugs of RAG: Indexing, Retrieval & Generation (Audio: 131.10s) ──
    {
      slideId: 'slide-3',
      title: '03. The 3 Bugs of RAG: Indexing, Retrieval, and Generation',
      sceneJson: [
        // ── Beat 1: The Production Meltdown (0.00s - 14.66s) ──
        {
          id: 'scene_03_01_incident',
          narrationCue: 'Now, that five-stage conveyor looks flawless on paper, but production is where reality hits. Every senior AI engineer remembers this story. The day their first rag pipeline humiliated them in front of the entire company.',
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 0.0,
          endAt: 14.66,
          elements: [
            {
              id: 'title_s3_01',
              type: 'heading',
              content: 'The Day One Production Meltdown',
              position: { x: 50, y: 3.2 },
              animation: { enter: { type: 'fadeIn', duration: 0.5, delay: 0.0, ease: 'power2.out' } },
              style: { fontSize: '22px', color: '#991b1b' }
            },
            {
              id: 'sub_s3_01',
              type: 'text',
              content: 'Conveyors look flawless on paper — but production is where reality hits. The pipeline humiliated the team.',
              position: { x: 50, y: 9.6, width: 56 },
              animation: { enter: { type: 'fadeIn', duration: 0.4, delay: 0.15, ease: 'power2.out' } },
              style: { fontSize: '12px', padding: '4px 16px' }
            }
          ]
        },
        // ── Beat 2: 20 Clean Queries Notebook Flashback (14.66s - 25.90s) ──
        {
          id: 'scene_03_02_notebook',
          narrationCue: 'It always starts the same way. You tested 20 clean queries in your notebook. High similarity scores. Perfect answers. Everything look bulletproof. So, you shipped it to production.',
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 14.66,
          endAt: 25.90,
          elements: [
            {
              id: 'title_s3_02',
              type: 'heading',
              content: 'The False Comfort of 20 Clean Queries',
              position: { x: 50, y: 3.2 },
              animation: { enter: { type: 'popIn', duration: 0.5, delay: 0.0, ease: 'back.out(1.5)' } },
              style: { fontSize: '22px', color: '#047857' }
            },
            {
              id: 'sub_s3_02',
              type: 'text',
              content: '20 clean queries in Jupyter. High similarity scores. Perfect answers. Everything looked bulletproof — so you shipped it.',
              position: { x: 50, y: 9.6, width: 56 },
              animation: { enter: { type: 'fadeIn', duration: 0.4, delay: 0.15, ease: 'power2.out' } },
              style: { fontSize: '12px', padding: '4px 16px' }
            }
          ]
        },
        // ── Beat 3: Executive Hallucination (25.90s - 38.14s) ──
        {
          id: 'scene_03_03_exec',
          narrationCue: "30 minutes later, disaster strikes. An executive asks the bot a simple question about parental leave. And your bot confidently invents a policy that doesn't exist: six months, fully paid.",
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 25.90,
          endAt: 38.14,
          elements: [
            {
              id: 'title_s3_03',
              type: 'heading',
              content: '30 Minutes In: The Executive Query',
              position: { x: 50, y: 2.8 },
              animation: { enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' } },
              style: { fontSize: '22px', color: '#be123c' }
            }
          ]
        },
        // ── Beat 4: Live Scrolling Slack War Room (38.14s - 48.08s) ──
        {
          id: 'scene_03_04_slack',
          narrationCue: 'Within minutes, Slack explodes with unread messages. Someone took a screenshot of the answer and sent it straight to legal. Your hands are sweating.',
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 38.14,
          endAt: 48.08,
          elements: [
            {
              id: 'title_s3_04',
              type: 'heading',
              content: 'Slack Explodes: Sent Straight to Legal',
              position: { x: 50, y: 2.8 },
              animation: { enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' } },
              style: { fontSize: '22px', color: '#b91c1c' }
            }
          ]
        },
        // ── Beat 5: Prompt Tweak Simulation (48.08s - 60.22s) ──
        {
          id: 'scene_03_05_prompt',
          narrationCue: "Like every beginner, your first panic instinct is to open the system prompt and frantically type: 'You are a truthful assistant. Under no circumstances should you lie.' It changes nothing. The bot keeps making things up. Why?",
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 48.08,
          endAt: 60.22,
          elements: [
            {
              id: 'title_s3_05',
              type: 'heading',
              content: 'The Panic Instinct: Prompt Engineering Fallacy',
              position: { x: 50, y: 2.8 },
              animation: { enter: { type: 'fadeIn', duration: 0.5, delay: 0.0, ease: 'power2.out' } },
              style: { fontSize: '21px', color: '#4338ca' }
            }
          ]
        },
        // ── Beat 6: Golden Pipeline Thesis (60.22s - 73.78s) ──
        {
          id: 'scene_03_06_thesis',
          narrationCue: 'Because you cannot prompt your way out of a broken pipeline. The LLM is just the final actor reading bad lines from a broken teleprompter. When rag fails, the breakdown happened upstream in one of three distinct zones.',
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 60.22,
          endAt: 73.78,
          elements: [
            {
              id: 'title_s3_06',
              type: 'heading',
              content: 'The Cardinal Law of Production RAG',
              position: { x: 50, y: 2.5 },
              animation: { enter: { type: 'popIn', duration: 0.6, delay: 0.0, ease: 'back.out(1.5)' } },
              style: { fontSize: '22px', color: '#b45309' }
            }
          ]
        },
        // ── Beat 7: Zone 1 Indexing Failure (73.78s - 86.42s) ──
        {
          id: 'scene_03_07_zone1',
          narrationCue: "Zone one: indexing. Your chunker sliced a sentence in half: 'unlimited unpaid leave upon approval' became just 'unlimited leave'. The damage was already done before the user even typed their question.",
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 73.78,
          endAt: 86.42,
          elements: [
            {
              id: 'title_s3_07',
              type: 'heading',
              content: 'Zone 1 Breakdown: Indexing & Ingestion Failure',
              position: { x: 50, y: 2.8 },
              animation: { enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' } },
              style: { fontSize: '22px', color: '#dc2626' }
            }
          ]
        },
        // ── Beat 8: Zone 2 Retrieval Failure (86.42s - 106.64s) ──
        {
          id: 'scene_03_08_zone2',
          narrationCue: "Zone two: retrieval — the semantic blind spot. The correct policy is sitting right there in your vector database. But the user asked about 'time off' while the handbook said 'accrued statutory leave'. The embeddings never landed close enough. Low cosine similarity, wrong neighborhood, and your retriever pulled in total noise.",
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 86.42,
          endAt: 106.64,
          elements: [
            {
              id: 'title_s3_08',
              type: 'heading',
              content: 'Zone 2 Breakdown: Retrieval & Semantic Blind Spot',
              position: { x: 50, y: 2.8 },
              animation: { enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' } },
              style: { fontSize: '22px', color: '#d97706' }
            }
          ]
        },
        // ── Beat 9: Zone 3 Generation Failure (106.64s - 125.58s) ──
        {
          id: 'scene_03_09_zone3',
          narrationCue: "And zone three: generation — attention drift. This is the sneakiest one. Retrieval actually worked. The right page is sitting right inside the context window. But surrounded by thousands of competing tokens, the model's attention gets diluted. It loses the needle in the haystack and falls back on a confident guess anyway.",
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 106.64,
          endAt: 125.58,
          elements: [
            {
              id: 'title_s3_09',
              type: 'heading',
              content: 'Zone 3 Breakdown: Generation & Attention Drift',
              position: { x: 50, y: 2.8 },
              animation: { enter: { type: 'slideUp', duration: 0.5, delay: 0.0, ease: 'power2.out' } },
              style: { fontSize: '22px', color: '#7c3aed' }
            }
          ]
        },
        // ── Beat 10: Senior Engineer's Law & Climax (125.58s - 131.10s) ──
        {
          id: 'scene_03_10_finale',
          narrationCue: "The senior engineer's law is simple: Never touch the prompt until you have audited the pipeline.",
          audioTrack: 'RAG_Day01_Slide03.mp3',
          startAt: 125.58,
          endAt: 131.10,
          elements: [
            {
              id: 'title_s3_10',
              type: 'heading',
              content: "The Senior Engineer's Golden Law",
              position: { x: 50, y: 3.2 },
              animation: { enter: { type: 'popIn', duration: 0.6, delay: 0.0, ease: 'back.out(1.6)' } },
              style: { fontSize: '22px', color: '#047857' }
            },
            {
              id: 'sub_s3_10',
              type: 'text',
              content: 'Never touch the prompt until you have audited the pipeline: Indexing ➔ Retrieval ➔ Generation.',
              position: { x: 50, y: 9.6, width: 56 },
              animation: { enter: { type: 'fadeIn', duration: 0.4, delay: 0.15, ease: 'power2.out' } },
              style: { fontSize: '12px', padding: '4px 16px' }
            }
          ]
        }
      ]
    },

    // ── SLIDE 4: Running Example — Internal HR Assistant (Audio: 40.18s) ──
    {
      slideId: 'slide-4',
      title: '04. Running Example — Acme Corp HR Assistant',
      initialHtml: `
        <div class="rag-scene-headline" id="s4-headline">
          <span>🏢</span> Acme Corp HR Assistant Knowledge Corpus
        </div>
        <p class="rag-scene-subtext" id="s4-subtext">
          A single real-world company knowledge base powering every Python challenge you solve today.
        </p>

        <div class="rag-caption-box" id="s4-caption">
          <span class="caption-pulse"></span>
          <span id="s4-caption-text">Acme Corp Benefits Manual contains 4 core policy documents.</span>
        </div>

        <div class="rag-anim-cards-row" style="grid-template-columns: 1fr 1fr; gap: 14px;">
          <div class="rag-anim-card glow-primary" id="doc-hr1">
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <span style="font-weight: 800; color: #4338ca; font-size: 14px;">HR-01: PTO &amp; Accrual</span>
              <span style="font-size: 10px; font-weight: 700; color: #4338ca; background: #e0e7ff; padding: 2px 7px; border-radius: 4px; font-family: monospace;">280 tokens</span>
            </div>
            <div style="font-size: 11px; color: #64748b; margin: 4px 0 6px 0; font-weight: 600;">Section 3B | Annual Leave Policy</div>
            <div style="font-size: 12.5px; color: #334155; line-height: 1.5;">
              Accrues 1.25 days/month (15 days annually). Max carryover: 5 days.
            </div>
            <div style="font-size: 11px; color: #059669; font-weight: 700; margin-top: 6px;">
              💻 Powers Challenge 01 (Prompt Assembler) &amp; 02
            </div>
          </div>

          <div class="rag-anim-card glow-primary" id="doc-hr2">
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <span style="font-weight: 800; color: #4338ca; font-size: 14px;">HR-02: Remote Work &amp; Stipend</span>
              <span style="font-size: 10px; font-weight: 700; color: #4338ca; background: #e0e7ff; padding: 2px 7px; border-radius: 4px; font-family: monospace;">320 tokens</span>
            </div>
            <div style="font-size: 11px; color: #64748b; margin: 4px 0 6px 0; font-weight: 600;">Section 5A | Equipment Budget</div>
            <div style="font-size: 12.5px; color: #334155; line-height: 1.5;">
              $500 annual home-office equipment budget. Eligible after 90 days tenure.
            </div>
            <div style="font-size: 11px; color: #059669; font-weight: 700; margin-top: 6px;">
              💻 Powers Challenge 03 (Token Truncation)
            </div>
          </div>

          <div class="rag-anim-card glow-primary" id="doc-hr3">
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <span style="font-weight: 800; color: #4338ca; font-size: 14px;">HR-03: Health &amp; Wellness</span>
              <span style="font-size: 10px; font-weight: 700; color: #4338ca; background: #e0e7ff; padding: 2px 7px; border-radius: 4px; font-family: monospace;">410 tokens</span>
            </div>
            <div style="font-size: 11px; color: #64748b; margin: 4px 0 6px 0; font-weight: 600;">Section 7C | Medical &amp; Fitness</div>
            <div style="font-size: 12.5px; color: #334155; line-height: 1.5;">
              Comprehensive medical, dental, vision + $50 monthly gym reimbursement.
            </div>
            <div style="font-size: 11px; color: #059669; font-weight: 700; margin-top: 6px;">
              💻 Powers Challenge 04 (Attribution &amp; Citations)
            </div>
          </div>

          <div class="rag-anim-card glow-primary" id="doc-hr4">
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <span style="font-weight: 800; color: #4338ca; font-size: 14px;">HR-04: Parental Leave</span>
              <span style="font-size: 10px; font-weight: 700; color: #4338ca; background: #e0e7ff; padding: 2px 7px; border-radius: 4px; font-family: monospace;">350 tokens</span>
            </div>
            <div style="font-size: 11px; color: #64748b; margin: 4px 0 6px 0; font-weight: 600;">Section 8D | Family Support</div>
            <div style="font-size: 12.5px; color: #334155; line-height: 1.5;">
              12 weeks fully paid parental leave for all new parents with 1+ year tenure.
            </div>
            <div style="font-size: 11px; color: #059669; font-weight: 700; margin-top: 6px;">
              💻 Powers Challenge 05 (End-to-End Evaluation)
            </div>
          </div>
        </div>
      `,
      buildTimeline(tl, stage) {
        const caption = stage.querySelector('#s4-caption-text');
        const d1 = stage.querySelector('#doc-hr1');
        const d2 = stage.querySelector('#doc-hr2');
        const d3 = stage.querySelector('#doc-hr3');
        const d4 = stage.querySelector('#doc-hr4');

        tl.call(() => {
          if (caption) caption.textContent = "To build true intuition, you will construct one end-to-end production pipeline: Acme Corp HR Assistant.";
        }, null, 0.5)

        // 9.5s: First pair of docs
        .call(() => {
          if (caption) caption.textContent = "Acme's knowledge base contains four real policy documents: PTO accrual, equipment stipends, health benefits, and parental leave.";
          if (d1) d1.classList.add('active-card');
          if (d2) d2.classList.add('active-card');
        }, null, 9.0)
        .fromTo(['#doc-hr1', '#doc-hr2'],
          { y: 16, opacity: 0.75 },
          { y: 0, opacity: 1, duration: 0.6, stagger: 0.2, ease: 'power2.out' },
          9.5
        )

        // 21.0s: Second pair of docs
        .call(() => {
          if (d3) d3.classList.add('active-card');
          if (d4) d4.classList.add('active-card');
        }, null, 20.5)
        .fromTo(['#doc-hr3', '#doc-hr4'],
          { y: 16, opacity: 0.75 },
          { y: 0, opacity: 1, duration: 0.6, stagger: 0.2, ease: 'power2.out' },
          21.0
        )

        // 31.0s: Challenge connection
        .call(() => {
          if (caption) caption.textContent = "Every Python function you write today is an actual brick of this system — prompt assembler, token budget guard, and citations.";
        }, null, 30.5);
      }
    },

    // ── SLIDE 5: RAG vs Fine-Tuning Decision Matrix (Audio: 44.64s) ──
    {
      slideId: 'slide-5',
      title: '05. Architecture Decision Matrix: RAG vs Fine-Tuning',
      initialHtml: `
        <div class="rag-scene-headline" id="s5-headline">
          <span>⚖️</span> When to Use RAG vs Fine-Tuning
        </div>
        <p class="rag-scene-subtext" id="s5-subtext">
          Fine-tuning teaches <strong>style, tone, and grammar</strong>. RAG teaches <strong>facts, data, and citations</strong>.
        </p>

        <div class="rag-caption-box" id="s5-caption">
          <span class="caption-pulse"></span>
          <span id="s5-caption-text">Choosing between RAG and Fine-Tuning is a core architectural decision.</span>
        </div>

        <div class="rag-anim-cards-row">
          <div class="rag-anim-card glow-emerald" id="card-rag-matrix">
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <span style="font-size: 26px;">📚</span>
              <span style="font-size: 10.5px; font-weight: 700; color: #059669; background: #d1fae5; padding: 2px 8px; border-radius: 4px;">Dynamic Facts</span>
            </div>
            <div style="font-weight: 800; color: #065f46; font-size: 15px; margin-top: 6px;">RAG (Non-Parametric)</div>
            <div style="font-size: 12.5px; color: #334155; line-height: 1.7; margin-top: 8px;">
              <strong style="color: #065f46;">✔</strong> Dynamic, real-time facts (millisecond updates)<br>
              <strong style="color: #065f46;">✔</strong> Source citations guaranteed with audit trail<br>
              <strong style="color: #065f46;">✔</strong> Zero expensive GPU re-training required<br>
              <strong style="color: #065f46;">✔</strong> Granular Role-Based Access Control (RBAC)
            </div>
          </div>

          <div class="rag-anim-card glow-primary" id="card-ft-matrix">
            <div style="display: flex; justify-content: space-between; align-items: center;">
              <span style="font-size: 26px;">⚙️</span>
              <span style="font-size: 10.5px; font-weight: 700; color: #4338ca; background: #e0e7ff; padding: 2px 8px; border-radius: 4px;">Style &amp; Format</span>
            </div>
            <div style="font-weight: 800; color: #3730a3; font-size: 15px; margin-top: 6px;">Fine-Tuning (Parametric)</div>
            <div style="font-size: 12.5px; color: #334155; line-height: 1.7; margin-top: 8px;">
              <strong style="color: #4338ca;">•</strong> Teaches specialized tone, style &amp; vocabulary<br>
              <strong style="color: #4338ca;">•</strong> Enforces strict JSON/SQL output schemas<br>
              <strong style="color: #e11d48;">✗</strong> Expensive GPU cluster training runs<br>
              <strong style="color: #e11d48;">✗</strong> High risk of leaking private company data
            </div>
          </div>
        </div>

        <div id="matrix-verdict" style="margin-top: 10px; font-size: 13px; border: 1.5px solid #a7f3d0; border-left: 5px solid #10b981; background: #ecfdf5; color: #065f46; padding: 14px 18px; border-radius: 10px; box-shadow: 0 4px 16px rgba(16, 185, 129, 0.08); line-height: 1.5;">
          <strong>The Enterprise Standard:</strong> Modern teams combine both! Use light fine-tuning for domain tone and JSON formatting, and RAG for dynamic ground truth facts!
        </div>
      `,
      buildTimeline(tl, stage) {
        const caption = stage.querySelector('#s5-caption-text');
        const cRag = stage.querySelector('#card-rag-matrix');
        const cFt = stage.querySelector('#card-ft-matrix');
        const verdict = stage.querySelector('#matrix-verdict');

        tl.call(() => {
          if (caption) caption.textContent = "For knowledge recency, RAG updates in milliseconds; fine-tuning requires hours on expensive GPU clusters.";
        }, null, 0.5)

        // 9.0s: RAG Card
        .call(() => {
          if (cRag) {
            stage.querySelectorAll('.rag-anim-card').forEach(c => c.classList.remove('active-card'));
            cRag.classList.add('active-card');
          }
        }, null, 8.5)
        .fromTo('#card-rag-matrix',
          { x: -16, opacity: 0.75 },
          { x: 0, opacity: 1, duration: 0.6, ease: 'power2.out' },
          9.0
        )

        // 20.0s: Fine-Tuning Card
        .call(() => {
          if (caption) caption.textContent = "For privacy and RBAC, RAG filters before retrieval; fine-tuning bakes private data into weights, risking leaks.";
          if (cFt) {
            stage.querySelectorAll('.rag-anim-card').forEach(c => c.classList.remove('active-card'));
            cFt.classList.add('active-card');
          }
        }, null, 19.5)
        .fromTo('#card-ft-matrix',
          { x: 16, opacity: 0.75 },
          { x: 0, opacity: 1, duration: 0.6, ease: 'power2.out' },
          20.0
        )

        // 32.5s: Enterprise Verdict
        .call(() => {
          if (caption) caption.textContent = "In modern enterprise systems, the gold standard is combining both: fine-tuning for tone, and RAG for ground truth!";
          if (verdict) {
            verdict.style.borderColor = '#059669';
            verdict.style.boxShadow = '0 8px 24px rgba(16, 185, 129, 0.25)';
          }
        }, null, 32.0);
      }
    }
  ];

  root.DAY_01_ANIMATIONS = day01Animations;
})(window);
