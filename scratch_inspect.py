import whisper

m = whisper.load_model('base')
res = m.transcribe('marketing/output/audio/SQL-02-R2_narration.mp3', word_timestamps=True)

def extract_words_from_segs(segs):
    extracted = []
    for s in segs:
        for w_tok in s.get('words', []):
            clean_w = w_tok['word'].strip()
            if clean_w:
                extracted.append({
                    "word": clean_w,
                    "startMs": round(w_tok['start'] * 1000),
                    "endMs": round(w_tok['end'] * 1000)
                })
    return extracted

all_raw_words = extract_words_from_segs(res['segments'])

dur_hook = 2460
dur_line2 = 2740
t_line2_start = dur_hook
t_clock_in = t_line2_start + dur_line2 + 50

words_p0, words_p1, words_choose, words_opta, words_optb, words_cta = [], [], [], [], [], []

opt_a_started = False
opt_a_done = False
opt_b_started = False
opt_b_done = False

for word_item in all_raw_words:
    t = word_item["startMs"]
    txt = word_item["word"].lower().strip(".,!?:;\"'")
    
    if t < t_line2_start - 80:
        words_p0.append(word_item)
    elif t < t_clock_in - 50:
        words_p1.append(word_item)
    elif not opt_a_started and txt in ["choose", "your", "answer"]:
        words_choose.append(word_item)
    elif (txt == "option" or opt_a_started) and not opt_a_done and not opt_b_started:
        opt_a_started = True
        words_opta.append(word_item)
        if txt == "a":
            opt_a_done = True
    elif (txt in ["or", "option", "b"] or opt_b_started) and not opt_b_done and t < 12000:
        opt_b_started = True
        words_optb.append(word_item)
        if txt == "b":
            opt_b_done = True
    else:
        words_cta.append(word_item)

print("P0:", [w['word'] for w in words_p0])
print("P1:", [w['word'] for w in words_p1])
print("P2 (Choose):", [w['word'] for w in words_choose])
print("P3 (Option A):", [w['word'] for w in words_opta])
print("P4 (Option B):", [w['word'] for w in words_optb])
print("P5 (CTA):", [w['word'] for w in words_cta])
