"""
=============================================================================
Manodemy AI Code Metaphor Agent (Art Director for High-CTR Reel Covers)
=============================================================================
Converts complex SQL/Python algorithmic challenges into stunning 3D isometric
conceptual art prompts and composes them into 1:1 Instagram/YouTube covers.
"""

from pathlib import Path
import json

# Taxonomy of Conceptual 3D Art Metaphors for Coding Challenges
METAPHOR_TAXONOMY = {
    "gaps_islands": {
        "title": "DATA ARCHIPELAGO · STREAK ISLANDS",
        "description": "Consecutive login streaks vs date gaps",
        "prompt": (
            "Minimalist futuristic 3D isometric octane render of glowing cybernetic data islands "
            "floating in deep dark space. The islands represent consecutive login streaks, glowing "
            "with vibrant neon cyan and golden energy. Glowing fiber-optic laser bridges connect consecutive "
            "islands into an unbroken streak chain, while an empty gap abyss separates disconnected islands. "
            "Minimalist glassmorphic aesthetic, subtle holographic grid, volumetric neon rim lighting, "
            "pitch black dark space background (#04060c), 8k resolution, clean tech art without any text."
        ),
        "overlay_label": "DATA ARCHIPELAGO · STREAK ISLANDS"
    },
    "null_trap": {
        "title": "THE VOID ABYSS · SILENT 0-ROWS",
        "description": "NOT IN subquery failing due to NULL trap",
        "prompt": (
            "Minimalist futuristic 3D isometric octane render of a glowing glassmorphic neon database matrix table. "
            "One central floating data cell contains a pitch-black cosmic singularity vortex or trapdoor swallowing "
            "streams of holographic binary rows into zero existence. High-contrast neon cyan (#00f0ff) and crimson "
            "warning glow, volumetric lighting, pitch black background (#04060c), ultra-clean cyber tech aesthetic, "
            "8k resolution, zero text."
        ),
        "overlay_label": "THE NULL TRAP · 0-ROWS ANOMALY"
    },
    "window_ranking": {
        "title": "PODIUM CLASH · DENSE RANK VS RANK",
        "description": "Leaderboard tie-breaking with salary tiers",
        "prompt": (
            "Minimalist futuristic 3D isometric render of holographic neon holographic winner podium tiers and energy conduits. "
            "Two identical golden glowing trophies stand on the same tier with equal height, while light beams branch "
            "into consecutive clean numerical tiers without skipping steps. Volumetric amber-gold and cyan lighting, "
            "deep dark void background (#04060c), glassmorphic cyberpunk finish, 8k resolution, zero text."
        ),
        "overlay_label": "PODIUM DYNAMICS · TIE RESOLUTION"
    },
    "duplicate_dedup": {
        "title": "DUPLICATE COLLAPSE · ROW_NUMBER CTE",
        "description": "Filtering latest transactions per group",
        "prompt": (
            "Minimalist futuristic 3D isometric render of stacked translucent glass data cubes filtering through an energy prism. "
            "Twin identical glowing transaction blocks merge and dissolve into a single pristine golden primary record, "
            "while duplicate ghosts vaporize into cyan stardust. Volumetric studio rim lighting, pitch black background (#04060c), "
            "8k resolution, zero text."
        ),
        "overlay_label": "LATEST RECORD · DEDUP MATRIX"
    }
}

class CodeMetaphorAgent:
    """Agent that translates code queries into visual art prompts and manages thumbnail composition."""
    
    @staticmethod
    def get_metaphor(challenge_id: str, topic_hint: str = ""):
        challenge_id = challenge_id.upper()
        if "SQL-10" in challenge_id or "ISLAND" in topic_hint.upper() or "STREAK" in topic_hint.upper():
            return METAPHOR_TAXONOMY["gaps_islands"]
        elif "SQL-01" in challenge_id or "NULL" in topic_hint.upper():
            return METAPHOR_TAXONOMY["null_trap"]
        elif "SQL-02" in challenge_id or "RANK" in topic_hint.upper():
            return METAPHOR_TAXONOMY["window_ranking"]
        elif "SQL-09" in challenge_id or "LATEST" in topic_hint.upper() or "DEDUP" in topic_hint.upper():
            return METAPHOR_TAXONOMY["duplicate_dedup"]
        # Default fallback
        return METAPHOR_TAXONOMY["gaps_islands"]

if __name__ == "__main__":
    print("Code Metaphor Agent initialized with taxonomies:")
    for k, v in METAPHOR_TAXONOMY.items():
        print(f"  - {k}: {v['title']}")
