// Polyfill global __dirname for Vercel Edge Runtime compatibility (e.g., for @opentelemetry/api)
if (typeof globalThis !== 'undefined' && typeof (globalThis as any).__dirname === 'undefined') {
  (globalThis as any).__dirname = '/';
}
