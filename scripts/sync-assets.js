/**
 * sync-assets.js
 * Automatically keeps root assets and public/ assets perfectly synchronized
 * so no manual copy-paste errors ever happen in production builds.
 */

const fs = require('fs');
const path = require('path');

const ROOT_DIR = path.resolve(__dirname, '..');
const PUBLIC_DIR = path.join(ROOT_DIR, 'public');

const SYNC_PAIRS = [
  { src: path.join(ROOT_DIR, 'landing_v2'), dest: path.join(PUBLIC_DIR, 'landing_v2') },
  { src: path.join(ROOT_DIR, 'home.html'), dest: path.join(PUBLIC_DIR, 'home.html') },
  { src: path.join(ROOT_DIR, 'referral-earnings.html'), dest: path.join(PUBLIC_DIR, 'referral-earnings.html') },
  { src: path.join(ROOT_DIR, 'admin.html'), dest: path.join(PUBLIC_DIR, 'admin.html') },
  { src: path.join(ROOT_DIR, 'supabase.js'), dest: path.join(PUBLIC_DIR, 'supabase.js') }
];

function copyRecursiveSync(src, dest) {
  if (!fs.existsSync(src)) return;

  const stats = fs.statSync(src);
  if (stats.isDirectory()) {
    if (!fs.existsSync(dest)) {
      fs.mkdirSync(dest, { recursive: true });
    }
    const files = fs.readdirSync(src);
    for (const file of files) {
      copyRecursiveSync(path.join(src, file), path.join(dest, file));
    }
  } else {
    const destDir = path.dirname(dest);
    if (!fs.existsSync(destDir)) {
      fs.mkdirSync(destDir, { recursive: true });
    }
    fs.copyFileSync(src, dest);
  }
}

console.log('[Manodemy Build Sync] Synchronizing root assets to public/...');
for (const pair of SYNC_PAIRS) {
  try {
    copyRecursiveSync(pair.src, pair.dest);
    console.log(` ✓ Synced ${path.relative(ROOT_DIR, pair.src)} -> ${path.relative(ROOT_DIR, pair.dest)}`);
  } catch (err) {
    console.warn(` ⚠ Sync notice for ${pair.src}:`, err.message);
  }
}
console.log('[Manodemy Build Sync] Complete.');
