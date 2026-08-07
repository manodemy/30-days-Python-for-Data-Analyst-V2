import urllib.request, json, ssl, urllib.error

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

SUPA_URL = "https://erqoyvbuhmkyvcqgwcbz.supabase.co"
ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw"

req = urllib.request.Request(
    f"{SUPA_URL}/rest/v1/notebook_content?day_id=eq.sql-day01",
    headers={
        "apikey": ANON_KEY,
        "Authorization": f"Bearer {ANON_KEY}"
    }
)

try:
    with urllib.request.urlopen(req, context=ctx) as r:
        data = json.loads(r.read().decode())
        if data:
            print("SUCCESS: Found notebook content for sql-day01!")
            print(f"Title: {data[0].get('title')}")
        else:
            print("FAILED: Notebook content for sql-day01 is empty!")
except Exception as e:
    print(f"ERROR: {e}")
