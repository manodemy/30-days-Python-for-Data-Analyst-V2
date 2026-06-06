'use client';

import React, { useEffect, useRef } from 'react';

interface CodeMirrorEditorProps {
  initialValue: string;
  onChange?: (val: string) => void;
  onRun?: (val: string) => void;
  readOnly?: boolean;
}

/**
 * A Client-side React component wrapper for CodeMirror editors.
 * Prevents keyboard traps by allowing users to blur focus using 'Esc' or 'Escape'.
 */
export default function CodeMirrorEditor({
  initialValue,
  onChange,
  onRun,
  readOnly = false
}: CodeMirrorEditorProps) {
  const containerRef = useRef<HTMLTextAreaElement>(null);
  const editorRef = useRef<any>(null);

  useEffect(() => {
    if (typeof window === 'undefined') return;

    const initCM = () => {
      const CodeMirror = (window as any).CodeMirror;
      if (!CodeMirror || !containerRef.current) return;

      const cm = CodeMirror.fromTextArea(containerRef.current, {
        mode: 'python',
        lineNumbers: true,
        indentUnit: 4,
        tabSize: 4,
        readOnly,
        autoCloseBrackets: true,
        matchBrackets: true,
        styleActiveLine: true,
        extraKeys: {
          'Shift-Enter': () => onRun && onRun(cm.getValue()),
          'Ctrl-Enter': () => onRun && onRun(cm.getValue()),
          'Esc': () => cm.getInputField().blur(),
          'Escape': () => cm.getInputField().blur(),
          'Tab': (cmInstance: any) => {
            if (cmInstance.somethingSelected()) {
              cmInstance.indentSelection('add');
            } else {
              cmInstance.replaceSelection('    ', 'end');
            }
          },
          'Shift-Tab': (cmInstance: any) => cmInstance.indentSelection('subtract'),
        }
      });

      cm.on('change', () => {
        if (onChange) onChange(cm.getValue());
      });

      editorRef.current = cm;
    };

    // Load CM if already ready, otherwise poll dynamically
    if ((window as any).CodeMirror) {
      initCM();
    } else {
      const interval = setInterval(() => {
        if ((window as any).CodeMirror) {
          clearInterval(interval);
          initCM();
        }
      }, 100);
      return () => clearInterval(interval);
    }

    return () => {
      if (editorRef.current) {
        editorRef.current.toTextArea();
      }
    };
  }, [readOnly, onRun, onChange]);

  return (
    <textarea
      ref={containerRef}
      defaultValue={initialValue}
      style={{ display: 'none' }}
    />
  );
}
