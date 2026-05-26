import urllib.request, json, ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

SUPA_URL = "https://erqoyvbuhmkyvcqgwcbz.supabase.co"
ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw"

headers = {
    "apikey": ANON_KEY,
    "Authorization": f"Bearer {ANON_KEY}"
}

req = urllib.request.Request(
    f"{SUPA_URL}/rest/v1/reviews?select=*&limit=1",
    headers=headers,
    method="GET"
)

try:
    with urllib.request.urlopen(req, context=ctx) as r:
        data = json.loads(r.read().decode())
        if data:
            print("Row data keys:", list(data[0].keys()))
            print("First row:", data[0])
        else:
            print("No rows found in reviews table.")
except Exception as e:
    print("Error:", e)
