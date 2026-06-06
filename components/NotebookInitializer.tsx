'use client';

import { useEffect } from 'react';

/**
 * NotebookInitializer invokes the global initializeNotebook function
 * strictly after React hydration is complete.
 */
export default function NotebookInitializer() {
  useEffect(() => {
    if (typeof window === 'undefined') return;

    const runInit = () => {
      if ((window as any).initializeNotebook) {
        console.log('[Notebook] Initializing CodeMirror & Pyodide state post-hydration...');
        (window as any).initializeNotebook();
      } else {
        console.warn('[Notebook] window.initializeNotebook is not defined.');
      }
    };

    // Delay initialization slightly to let the browser frame settle post-hydration
    const timeout = setTimeout(runInit, 100);
    return () => clearTimeout(timeout);
  }, []);

  return null;
}
