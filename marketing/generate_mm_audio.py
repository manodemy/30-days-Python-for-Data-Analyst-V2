import asyncio
import edge_tts
import subprocess
import os

VOICE = "en-IN-NeerjaNeural"
OUTPUT_MP3 = "marketing/output/audio/mm_whatsapp_agent_explains.mp3"

SCRIPT = """
Hey Manoj! Marketing Madam here. 
Kettukonga, indha WhatsApp agent namma company-ku oru 24 by 7 Digital Sales Manager maadhiri!
Salary kekkaadhu, tea break edukkaadhu, thoongave thoongaadhu!

Idhu seiyira five important jobs idho:

Number one: Instant Welcome!
Oru student Instagram reel paathu number submit panna udane, just ten seconds-la avan WhatsApp-ku Day 1 and Day 2 Free Interactive Simulator link-ah anupidum!

Number two: Seven Day Follow-Up!
Student-ah namma marakkaama paathukum. Day 2-la code hints, Day 4-la interview cheat sheets, and Day 7-la offer anupi student mind-la Manodemy-ah active-ah vechirukum!

Number three: Doubt Solver!
Student WhatsApp-la, 'Bro, na Non-IT background, enaku SQL puriyuma?' nu ketaa, five seconds-la smart-ah reply panni convince pannum!

Number four: Cart Saver!
Payment page varaikum vandhutu drop aana students-ku, fifteen minutes-kulla polite 1-click payment link anupi drop aana sale-ah save pannum!

And Number five: Celebration Alert!
Student pay panna second-la, avanukku full sixty-day access unlock pannitu, unga personal phone-ku, 'Manoj thalaiva! New Admission! Two thousand rupees credit!' nu alert anupidum!

One line summary:
Lead website-kulla vara second-la irundhu... avan enroll panni unga bank-la kaasu vilura varaikum, indha agent-e full-ah automated-ah paathukum!
All on autopilot!
"""

async def generate():
    os.makedirs(os.path.dirname(OUTPUT_MP3), exist_ok=True)
    print(f"Generating audio with {VOICE}...")
    communicate = edge_tts.Communicate(SCRIPT.strip(), VOICE, rate="+4%", pitch="+0Hz")
    await communicate.save(OUTPUT_MP3)
    print(f"Audio saved to: {OUTPUT_MP3}")

if __name__ == "__main__":
    asyncio.run(generate())
