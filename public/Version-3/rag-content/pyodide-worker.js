/* ═══════════════════════════════════════════════════════════════════
   Pyodide Web Worker — RAG Studio Code Execution Runtime
   ═══════════════════════════════════════════════════════════════════
   Runs CPython 3.11 (Pyodide WASM) inside a dedicated Web Worker.
   Handles: numpy loading, stdout/stderr capture, execution timeout,
   friendly import errors, and memory estimation.
   ═══════════════════════════════════════════════════════════════════ */

let pyodide = null;
let isReady = false;

// ── Pyodide CDN URL (pinned version for stability) ──
const PYODIDE_CDN = 'https://cdn.jsdelivr.net/pyodide/v0.26.4/full/';

// ── Boot Pyodide ──
async function initPyodide() {
  const t0 = performance.now();

  // Import Pyodide loader from CDN
  importScripts(PYODIDE_CDN + 'pyodide.js');

  // Load Pyodide runtime
  pyodide = await loadPyodide({
    indexURL: PYODIDE_CDN
  });

  const bootTime = ((performance.now() - t0) / 1000).toFixed(2);

  // ── Install numpy ──
  const t1 = performance.now();
  await pyodide.loadPackage('numpy');
  const numpyTime = ((performance.now() - t1) / 1000).toFixed(2);

  // ── Setup stdout/stderr capture, friendly imports, input denial & execution runner ──
  pyodide.runPython(`
import sys
import io
import traceback
import builtins

class _OutputCapture:
    """Captures stdout/stderr in memory."""
    def __init__(self, stream_name):
        self.stream_name = stream_name
        self.buffer = io.StringIO()
    
    def write(self, text):
        self.buffer.write(text)
        return len(text)
    
    def flush(self):
        pass
    
    def getvalue(self):
        return self.buffer.getvalue()

    def reset(self):
        self.buffer = io.StringIO()

_stdout_capture = _OutputCapture("stdout")
_stderr_capture = _OutputCapture("stderr")
sys.stdout = _stdout_capture
sys.stderr = _stderr_capture

# ── Friendly import blocker for non-browser packages ──
_UNAVAILABLE_PACKAGES = {
    'pandas': 'pandas is too large for browser execution. Use numpy arrays instead.',
    'torch': 'PyTorch requires 500MB+ and cannot run in the browser.',
    'transformers': 'Hugging Face Transformers requires PyTorch. Use pre-computed embeddings instead.',
    'sentence_transformers': 'Sentence Transformers requires PyTorch. Use pre-computed embeddings.',
    'chromadb': 'ChromaDB requires a server. Use manodemy_rag.mock_chroma instead.',
    'openai': 'API calls are handled by the platform. You do not need this package.',
    'anthropic': 'API calls are handled by the platform. You do not need this package.',
    'sklearn': 'scikit-learn is too large. Implement algorithms from scratch using numpy.',
    'scipy': 'SciPy is too large. Use numpy for the math functions you need.',
    'tiktoken': 'tiktoken is available via manodemy_rag.tokenizer module.'
}

_original_import = builtins.__import__

def _friendly_import(name, *args, **kwargs):
    if name in _UNAVAILABLE_PACKAGES:
        hint = _UNAVAILABLE_PACKAGES[name]
        raise ModuleNotFoundError(
            f"\\n📦 '{name}' is not available in the RAG Studio browser environment.\\n"
            f"💡 Hint: {hint}\\n"
            f"\\nAvailable packages: numpy, re, math, collections, json, and manodemy_rag modules."
        )
    return _original_import(name, *args, **kwargs)

builtins.__import__ = _friendly_import

# ── Setup input() denial ──
def _denied_input(prompt=''):
    raise RuntimeError(
        "\\n⌨️  input() is not supported in the RAG Studio browser environment.\\n"
        "💡 Use the provided test data and function parameters instead."
    )

builtins.input = _denied_input

# ── Internal Python execution harness ──
def _execute_code_internal(code_str):
    _stdout_capture.reset()
    _stderr_capture.reset()
    try:
        compiled = compile(code_str, "<student_code>", "exec")
        exec(compiled, globals())
        return {
            "success": True,
            "stdout": _stdout_capture.getvalue(),
            "error": None,
            "error_type": None
        }
    except Exception as e:
        tb_lines = traceback.format_exception(type(e), e, e.__traceback__)
        # Filter out the internal runner wrapper frames
        filtered = [l for l in tb_lines if "_execute_code_internal" not in l]
        clean_err = "".join(filtered).strip()
        return {
            "success": False,
            "stdout": _stdout_capture.getvalue(),
            "error": clean_err,
            "error_type": type(e).__name__
        }
    except SyntaxError as e:
        clean_err = "".join(traceback.format_exception_only(type(e), e)).strip()
        return {
            "success": False,
            "stdout": _stdout_capture.getvalue(),
            "error": clean_err,
            "error_type": "SyntaxError"
        }

# Warmup JIT and numpy caches
_execute_code_internal("import numpy as np\\n_v = np.dot([1.0, 2.0], [3.0, 4.0])")
  `);

  const totalTime = ((performance.now() - t0) / 1000).toFixed(2);

  isReady = true;

  // Signal ready to main thread
  self.postMessage({
    type: 'ready',
    bootTime: parseFloat(bootTime),
    numpyTime: parseFloat(numpyTime),
    totalTime: parseFloat(totalTime)
  });
}

// ── Execute student Python code ──
async function executeCode(code, executionId) {
  if (!isReady) {
    self.postMessage({
      type: 'error',
      executionId,
      error: 'Python runtime is still loading. Please wait...'
    });
    return;
  }

  const t0 = performance.now();

  try {
    pyodide.globals.set('_user_code_to_run', code);
    const pyResult = pyodide.runPython('_execute_code_internal(_user_code_to_run)');
    const jsResult = pyResult.toJs({ dict_converter: Object.fromEntries });
    pyResult.destroy();

    const execTime = (performance.now() - t0).toFixed(1);

    if (jsResult.success) {
      self.postMessage({
        type: 'result',
        executionId,
        stdout: jsResult.stdout || '',
        execTimeMs: parseFloat(execTime)
      });
    } else {
      self.postMessage({
        type: 'error',
        executionId,
        error: jsResult.error,
        errorType: jsResult.error_type,
        stdout: jsResult.stdout || '',
        execTimeMs: parseFloat(execTime)
      });
    }
  } catch (fatalErr) {
    const execTime = (performance.now() - t0).toFixed(1);
    self.postMessage({
      type: 'error',
      executionId,
      error: fatalErr.message || String(fatalErr),
      execTimeMs: parseFloat(execTime)
    });
  }
}

// ── Message handler ──
self.onmessage = async function(event) {
  const { type, code, executionId } = event.data;

  switch (type) {
    case 'init':
      try {
        await initPyodide();
      } catch (err) {
        self.postMessage({
          type: 'boot-error',
          error: `Failed to initialize Python runtime: ${err.message}`
        });
      }
      break;

    case 'execute':
      await executeCode(code, executionId);
      break;

    case 'ping':
      self.postMessage({ type: 'pong', ready: isReady });
      break;
  }
};
