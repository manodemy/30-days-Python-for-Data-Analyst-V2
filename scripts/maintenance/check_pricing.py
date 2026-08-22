import pathlib

path = pathlib.Path('public/admin.html')
content = path.read_text(encoding='utf-8')

# Locate tab-pricing start and modal end
start_marker = '<!-- ══ TAB 4: COUPONS & PRICING COMMAND CENTER ══ -->'
end_marker = '<!-- ══ END TAB 4 ══ -->' # Let's check what comes after tab-pricing or modal

print("Marker check start:", start_marker in content)
