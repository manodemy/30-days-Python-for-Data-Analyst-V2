/**
 * Automated Voice Narration Pipeline CLI
 * =====================================
 * Reads narration scripts from: narrations/day-XX.json
 * Generates audio files into:  public/Version-3/DayXX/
 *
 * Usage:
 *   node scripts/build-audio.js --day=4
 *   node scripts/build-audio.js --day=4 --force
 *   node scripts/build-audio.js --all
 */

const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { execSync } = require('child_process');

const BASE_DIR = path.join(__dirname, '..', 'public', 'Version-3');
const NARRATIONS_DIR = path.join(__dirname, '..', 'narrations');
const CACHE_FILE = path.join(__dirname, '.audio-cache.json');

const args = process.argv.slice(2);
const dayArg = args.find(a => a.startsWith('--day='))?.split('=')[1];
const isForce = args.includes('--force');
const isAll = args.includes('--all');

if (!dayArg && !isAll) {
  console.log(`
🎙️  Automated Audio Generator CLI
---------------------------------
Usage:
  node scripts/build-audio.js --day=4
  node scripts/build-audio.js --day=4 --force
  node scripts/build-audio.js --all
  `);
  process.exit(0);
}

let cache = {};
if (fs.existsSync(CACHE_FILE)) {
  try {
    cache = JSON.parse(fs.readFileSync(CACHE_FILE, 'utf8'));
  } catch (e) {
    cache = {};
  }
}

function saveCache() {
  fs.writeFileSync(CACHE_FILE, JSON.stringify(cache, null, 2), 'utf8');
}

function hashText(text) {
  return crypto.createHash('md5').update(text.trim()).digest('hex');
}

/**
 * Generate speech file using Python edge-tts
 */
function generateSpeech(text, outputFile) {
  let cleanText = text.replace(/["'\r\n]+/g, ' ').replace(/\s+/g, ' ').trim();
  // Phonetic normalization for SQL keywords that TTS synthesizers might spell out as acronyms
  cleanText = cleanText
    .replace(/\bIN\b/g, 'in')
    .replace(/\bIS\b/g, 'is')
    .replace(/\bAS\b/g, 'as')
    .replace(/\bNULL\b/g, 'null')
    .replace(/\bNULLs\b/g, 'nulls');

  const voice = 'en-US-AndrewNeural'; // Clear, professional educational narrator
  
  const pyText = cleanText.replace(/\\/g, '\\\\').replace(/'/g, "\\'");
  const pyOutputFile = outputFile.replace(/\\/g, '/');

  const pyCmd = `python -c "import asyncio, edge_tts; asyncio.run(edge_tts.Communicate('''${pyText}''', '${voice}').save('''${pyOutputFile}'''))"`;

  try {
    execSync(pyCmd, { stdio: 'pipe' });
    return fs.existsSync(outputFile);
  } catch (err) {
    console.error(`❌ Error generating ${path.basename(outputFile)}: ${err.message}`);
    return false;
  }
}

function processDay(dayNum) {
  const dayStr = String(dayNum).padStart(2, '0');
  const jsonFile = path.join(NARRATIONS_DIR, `day-${dayStr}.json`);
  const outputDir = path.join(BASE_DIR, `Day${dayStr}`);

  if (!fs.existsSync(jsonFile)) {
    console.error(`❌ Narration script file not found: ${jsonFile}`);
    console.error(`   Please create narrations/day-${dayStr}.json`);
    return;
  }

  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  console.log(`\n==================================================`);
  console.log(`🎙️  Processing Day ${dayStr} Narration Pipeline`);
  console.log(`   Source: narrations/day-${dayStr}.json`);
  console.log(`==================================================`);

  const narrationData = JSON.parse(fs.readFileSync(jsonFile, 'utf8'));

  let generated = 0;
  let skipped = 0;

  // 1. Process Lecture Audios
  if (narrationData.lecture) {
    for (let [fileName, text] of Object.entries(narrationData.lecture)) {
      const res = handleAudioItem(fileName, text, outputDir);
      if (res === 'generated') generated++;
      else if (res === 'skipped') skipped++;
    }
  }

  // 2. Process Practice Question & Solution Audios
  if (narrationData.questions) {
    for (let [fileName, text] of Object.entries(narrationData.questions)) {
      const res = handleAudioItem(fileName, text, outputDir);
      if (res === 'generated') generated++;
      else if (res === 'skipped') skipped++;
    }
  }

  saveCache();
  console.log(`\n✅ Day ${dayStr} Audio Pipeline Complete! (${generated} generated, ${skipped} cached)\n`);
}

function handleAudioItem(fileName, text, outputDir) {
  const filePath = path.join(outputDir, fileName);
  const textHash = hashText(text);

  if (!isForce && fs.existsSync(filePath) && cache[fileName] === textHash) {
    console.log(`  ⏭️  Skipped (cached): ${fileName}`);
    return 'skipped';
  }

  console.log(`  🔊 Generating: ${fileName}`);
  console.log(`     Text: "${text.substring(0, 60)}..."`);
  
  const success = generateSpeech(text, filePath);
  if (success) {
    cache[fileName] = textHash;
    console.log(`     ✅ Saved: ${fileName}`);
    return 'generated';
  }
  return 'failed';
}

function main() {
  if (isAll) {
    for (let d = 1; d <= 30; d++) {
      if (fs.existsSync(path.join(NARRATIONS_DIR, `day-${String(d).padStart(2, '0')}.json`))) {
        processDay(d);
      }
    }
  } else if (dayArg) {
    processDay(parseInt(dayArg, 10));
  }
}

main();
