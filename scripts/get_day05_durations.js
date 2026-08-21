const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const dir = path.join(__dirname, '..', 'public', 'Version-3', 'Day05');

const lectureFiles = [];
for (let i = 1; i <= 23; i++) {
  lectureFiles.push(`New_Day5Part1audio${String(i).padStart(2, '0')}.mp3`);
}

const questionFiles = [];
for (let i = 1; i <= 15; i++) {
  questionFiles.push(`New_Day5Question${String(i).padStart(2, '0')}.mp3`);
  questionFiles.push(`New_Day5Question${String(i).padStart(2, '0')}sol.mp3`);
}

const allOrdered = [...lectureFiles, ...questionFiles];
const durations = [];

for (const f of allOrdered) {
  const p = path.join(dir, f);
  if (fs.existsSync(p)) {
    try {
      const durStr = execSync(`ffprobe -i "${p}" -show_entries format=duration -v quiet -of csv="p=0"`, { encoding: 'utf8' }).trim();
      durations.push(parseFloat(parseFloat(durStr).toFixed(1)));
    } catch(e) {
      durations.push(5.0);
    }
  } else {
    durations.push(5.0);
  }
}

console.log('const day05Durations = ' + JSON.stringify(durations) + ';');
