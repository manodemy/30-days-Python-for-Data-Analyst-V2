/**
 * 🚀 MANODEMY MARKETING SUITE — CORE ENGINE v1.0
 * ─────────────────────────────────────────────────────────────
 * Autonomous multi-agent pipeline for 9:16 vertical reels.
 * Generates 1-Click Launchpad Pack in marketing/output/
 */

const fs = require('fs');
const path = require('path');

const PLAYBOOK_PATH = path.join(__dirname, 'playbook.json');
const TEMPLATE_PATH = path.join(__dirname, 'templates', 'neon-radial-clock.html');
const OUTPUT_BASE = path.join(__dirname, 'output');

function highlightSql(code) {
  return code
    .replace(/\b(SELECT|FROM|WHERE|AND|OR|NOT|AS|GROUP BY|ORDER BY|HAVING|LIMIT|JOIN|INNER|LEFT|RIGHT|IS|NULL|IN|COUNT|SUM|AVG|MIN|MAX|ROUND|COALESCE)\b/gi, '<span class="kw">$1</span>')
    .replace(/'([^']*)'/g, '<span class="str">\'$1\'</span>')
    .replace(/\b(\d+)\b/g, '<span class="num">$1</span>');
}

function highlightPython(code) {
  return code
    .replace(/\b(def|return|if|else|elif|for|in|while|import|from|as|class|try|except|with|True|False|None|lambda|and|or|not|is)\b/g, '<span class="kw">$1</span>')
    .replace(/'([^']*)'|"([^"]*)"/g, '<span class="str">\'$1$2\'</span>')
    .replace(/\b(\d+)\b/g, '<span class="num">$1</span>')
    .replace(/\b(len|print|range|append|extend|sort|sorted|list|dict|set|int|str|float|sum|min|max)\b/g, '<span class="col">$1</span>');
}

function generateReelPack(spec) {
  const {
    id,
    day,
    topic,
    language = 'SQL',
    hookTitle = 'WHICH QUERY AVOIDS THE BUG?',
    codeA,
    codeB,
    timerSeconds = 5,
    answerExplanation,
    correctOption = 'B',
    playgroundUrl = 'https://www.manodemy.com/go/free_trial',
    hashtags = ['#sql', '#dataanalytics', '#codinginterview', '#python', '#manodemy']
  } = spec;

  const targetDir = path.join(OUTPUT_BASE, id);
  if (!fs.existsSync(targetDir)) {
    fs.mkdirSync(targetDir, { recursive: true });
  }

  // 1. Render HTML Template
  let templateHtml = fs.readFileSync(TEMPLATE_PATH, 'utf-8');
  const codeAHtml = language === 'Python' ? highlightPython(codeA) : highlightSql(codeA);
  const codeBHtml = language === 'Python' ? highlightPython(codeB) : highlightSql(codeB);

  const renderedHtml = templateHtml
    .replace(/{{TITLE}}/g, hookTitle)
    .replace(/{{HOOK_TITLE}}/g, hookTitle)
    .replace(/{{TIMER_SECONDS}}/g, String(timerSeconds).padStart(2, '0'))
    .replace(/{{CODE_A_HTML}}/g, codeAHtml)
    .replace(/{{CODE_B_HTML}}/g, codeBHtml);

  fs.writeFileSync(path.join(targetDir, 'index.html'), renderedHtml, 'utf-8');

  // 2. Write Caption Package
  const captionText = `${hookTitle} 💀\n\nCan you spot the subtle difference?\n\nDrop 'A' or 'B' below 👇 (Bonus points if you explain WHY in one sentence!)\n\n💡 Want to test both queries against a live interactive database with real-time audio guidance?\n🔥 Try Day ${day || '01'} for FREE (No signup required).\n👉 Link in bio: @manodemy26\n\n${hashtags.join(' ')}`;
  fs.writeFileSync(path.join(targetDir, 'caption.txt'), captionText, 'utf-8');

  // 3. Write Pinned Comment (The Solution)
  const pinnedCommentText = `✅ CORRECT ANSWER: OPTION [ ${correctOption} ]\n\n💡 Why: ${answerExplanation}\n\n🚀 Want hands-on practice? Tap the link in bio to run this exact test in our interactive studio!`;
  fs.writeFileSync(path.join(targetDir, 'pinned_comment.txt'), pinnedCommentText, 'utf-8');

  // 4. Write Bio Test Link
  fs.writeFileSync(path.join(targetDir, 'link.txt'), playgroundUrl, 'utf-8');

  // 5. Update Playbook History
  if (fs.existsSync(PLAYBOOK_PATH)) {
    try {
      const playbook = JSON.parse(fs.readFileSync(PLAYBOOK_PATH, 'utf-8'));
      playbook.history.push({
        id,
        day,
        topic,
        language,
        hookTitle,
        correctOption,
        generatedAt: new Date().toISOString()
      });
      fs.writeFileSync(PLAYBOOK_PATH, JSON.stringify(playbook, null, 2), 'utf-8');
    } catch (e) {}
  }

  console.log(`\n======================================================`);
  console.log(`🎬 REEL LAUNCHPAD PACK READY: ${id}`);
  console.log(`📁 Saved to: ${targetDir}`);
  console.log(`📄 1-Click Deliverables:`);
  console.log(`   1. index.html          (1080x1920 9:16 Canvas)`);
  console.log(`   2. caption.txt         (Ready-to-Paste Instagram Caption)`);
  console.log(`   3. pinned_comment.txt  (Solution for Pinned Comment)`);
  console.log(`   4. link.txt            (Free Bio Playground Deep-Link)`);
  console.log(`======================================================\n`);

  return targetDir;
}

module.exports = { generateReelPack };
