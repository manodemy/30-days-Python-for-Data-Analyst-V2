/* ═══════════════════════════════════════════════════════════════════
   Manodemy RAG Studio — Python Scrimba Typewriter Engine (v1.0)
   Coordinates: CodeMirror 5 Line-by-Line Narration Sync,
   Indentation Protection, Student Draft Preservation & Auto-Grading
   ═══════════════════════════════════════════════════════════════════ */

(function(root) {
  'use strict';

  class PythonTypewriterSync {
    constructor(options = {}) {
      this.editor = options.editor || null;
      this.activeAudio = null;
      this.isTyping = false;
      this.typingTimer = null;
      this.currentQuestionId = null;
      this.userDrafts = {}; // qId -> saved student code
      this.timestamps = null;
      this.activeHighlightedLines = [];
    }

    setEditor(editor) {
      this.editor = editor;
      if (this.editor) {
        // Detect manual user intervention to yield control
        this.editor.on('beforeChange', (cm, change) => {
          if (this.isTyping && change.origin !== '+typewriter') {
            this.handleUserInterruption();
          }
        });
      }
    }

    setTimestamps(timestampsData) {
      this.timestamps = timestampsData;
    }

    // ── Save Current Student Draft before Solution Overwrite ──
    saveUserDraft(qId) {
      if (!this.editor) return;
      const currentCode = this.editor.getValue();
      const dayData = window.COURSE_CONTENT?.['rag-day01'];
      const q = dayData?.practiceQuestions?.find(item => item.id === qId);

      // Only save if different from starter code and not empty
      if (q && currentCode.trim() && currentCode.trim() !== (q.starterCode || '').trim()) {
        this.userDrafts[qId] = currentCode;
        this.showDraftRestoreToast(qId);
      }
    }

    restoreUserDraft(qId) {
      if (this.userDrafts[qId] && this.editor) {
        this.stop();
        this.editor.setValue(this.userDrafts[qId]);
        this.hideDraftRestoreToast();
        if (window.appendOutput) {
          window.appendOutput('🔄 Restored your draft code.\n', 'output-info');
        }
      }
    }

    showDraftRestoreToast(qId) {
      let toast = document.getElementById('draftRestoreToast');
      if (!toast) {
        toast = document.createElement('div');
        toast.id = 'draftRestoreToast';
        toast.className = 'rag-draft-toast';
        document.body.appendChild(toast);
      }
      toast.innerHTML = `
        <span>💾 Your draft was saved.</span>
        <button class="draft-restore-btn" onclick="window.pythonTypewriter && window.pythonTypewriter.restoreUserDraft(${qId})">Restore My Draft</button>
        <button class="draft-dismiss-btn" onclick="window.pythonTypewriter && window.pythonTypewriter.hideDraftRestoreToast()">&times;</button>
      `;
      toast.classList.add('show');
    }

    hideDraftRestoreToast() {
      const toast = document.getElementById('draftRestoreToast');
      if (toast) toast.classList.remove('show');
    }

    handleUserInterruption() {
      if (!this.isTyping) return;
      console.log('User typed in editor — gracefully yielding typewriter.');
      this.stop();
      if (window.appendOutput) {
        window.appendOutput('✍️ Typewriter yielded control to student.\n', 'output-info');
      }
    }

    // ── Play Solution Audio & Type Synchronized Python Code ──
    async playSolutionWalkthrough(qId, solutionCode, audioSrc) {
      this.stop();
      this.currentQuestionId = qId;
      if (!this.editor) return;

      // 1. Preserve student's in-progress code
      this.saveUserDraft(qId);

      // 2. Clear editor and prep for typing
      this.clearLineHighlights();
      this.editor.setValue('');
      this.isTyping = true;

      // 3. Setup Audio
      const audioUrl = audioSrc.startsWith('/') ? audioSrc : `/Version-3/${audioSrc}`;
      this.activeAudio = new Audio(audioUrl);
      const playbackSpeed = window.ragAnimator?.playbackRate || 1.0;
      this.activeAudio.playbackRate = playbackSpeed;
      this.activeAudio.preservesPitch = true;

      // Wire Solution Button UI state
      this.updateSolutionBtnUI(true);

      // 4. Split code into semantic lines for typewriter
      const lines = solutionCode.split('\n');
      let currentLineIdx = 0;

      // Check for Whisper word/segment alignment
      const filename = audioSrc.split('/').pop();
      const fileTimestamps = this.timestamps?.[filename];

      const duration = fileTimestamps?.duration || 14.0;
      const totalChars = solutionCode.length;
      // Calculate interval based on total audio duration and playback speed
      const baseCharInterval = Math.max(15, Math.min(45, (duration * 1000) / totalChars / 1.5)) / playbackSpeed;

      // Play audio
      try {
        await this.activeAudio.play();
      } catch (err) {
        console.warn('Audio play blocked by browser autoplay policy:', err);
      }

      let charPos = 0;
      const fullText = solutionCode;

      // Type character by character with indentation safety
      const typeNextChar = () => {
        if (!this.isTyping || !this.editor) return;

        if (charPos < fullText.length) {
          const char = fullText[charPos];
          const lineCount = this.editor.lineCount() - 1;
          const lastLineLen = this.editor.getLine(lineCount).length;

          this.editor.replaceRange(char, { line: lineCount, ch: lastLineLen }, undefined, '+typewriter');
          charPos++;

          // Auto-highlight active line being typed
          this.highlightActiveLine(lineCount);

          // Variable pause at newlines and punctuation for natural cadence
          let delay = baseCharInterval;
          if (char === '\n') delay = baseCharInterval * 4;
          else if (char === ':' || char === ',') delay = baseCharInterval * 2.5;

          this.typingTimer = setTimeout(typeNextChar, delay);
        } else {
          // Finished typing code
          this.finishTyping();
        }
      };

      typeNextChar();

      // Audio completion listener
      this.activeAudio.onended = () => {
        if (this.isTyping) {
          // Ensure full text is inserted if audio ends first
          this.editor.setValue(solutionCode);
          this.finishTyping();
        }
      };
    }

    highlightActiveLine(lineIdx) {
      if (!this.editor) return;
      this.clearLineHighlights();
      this.editor.addLineClass(lineIdx, 'background', 'scrimba-active-line');
      this.activeHighlightedLines.push(lineIdx);
    }

    clearLineHighlights() {
      if (!this.editor) return;
      this.activeHighlightedLines.forEach(lineIdx => {
        try {
          this.editor.removeLineClass(lineIdx, 'background', 'scrimba-active-line');
        } catch (e) {}
      });
      this.activeHighlightedLines = [];
    }

    finishTyping() {
      this.isTyping = false;
      if (this.typingTimer) {
        clearTimeout(this.typingTimer);
        this.typingTimer = null;
      }
      this.clearLineHighlights();
      this.updateSolutionBtnUI(false);

      if (window.appendOutput) {
        window.appendOutput('\n💡 Solution narration completed. Executing in Pyodide...\n', 'output-info');
      }

      // Auto-run code in Pyodide and trigger test suite
      setTimeout(() => {
        if (window.runCurrentCode) {
          window.runCurrentCode();
        }
        setTimeout(() => {
          if (window.gradeCurrentSubmission) {
            window.gradeCurrentSubmission();
          }
        }, 600);
      }, 400);
    }

    stop() {
      this.isTyping = false;
      if (this.typingTimer) {
        clearTimeout(this.typingTimer);
        this.typingTimer = null;
      }
      if (this.activeAudio) {
        this.activeAudio.pause();
        this.activeAudio = null;
      }
      this.clearLineHighlights();
      this.updateSolutionBtnUI(false);
    }

    updateSolutionBtnUI(isPlaying) {
      const btn = document.getElementById('solutionAudioBtn');
      if (btn) {
        btn.innerHTML = isPlaying 
          ? '<span>⏸</span> Stop Solution' 
          : '<span>💡</span> Solution Walkthrough';
        btn.classList.toggle('active', isPlaying);
      }
    }
  }

  root.PythonTypewriterSync = PythonTypewriterSync;
})(window);
