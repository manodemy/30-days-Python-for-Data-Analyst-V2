"""
Generate standalone Day 01 & Day 02 HTML pages in public/python and python/
"""

with open('public/python/index.html', 'r', encoding='utf-8') as f:
    template = f.read()

def generate_day_page(day_num, title, dest_paths):
    content = template
    # Replace title
    content = content.replace(
        '<title>Manodemy — Python for Data Analysts</title>',
        f'<title>Manodemy — Python Day {String_day}: {title}</title>'
    )
    # Inject window.COURSE_DAY
    script_inject = f"""  <!-- Set current day context -->
  <script>window.COURSE_DAY = {day_num};</script>
</head>"""
    content = content.replace('</head>', script_inject)
    
    # Cache busting update
    content = content.replace('styles.css?v=30.0', 'styles.css?v=35.0')
    content = content.replace('python-grading-engine.js?v=30.0', 'python-grading-engine.js?v=35.0')
    content = content.replace('python-engine.js?v=30.0', 'python-engine.js?v=35.0')
    
    for path in dest_paths:
        with open(path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Created {path}")

String_day = "01"
generate_day_page(1, "Data Types & Memory", ["public/python/day01.html", "python/day01.html"])

String_day = "02"
generate_day_page(2, "Operators & Expressions", ["public/python/day02.html", "python/day02.html"])
