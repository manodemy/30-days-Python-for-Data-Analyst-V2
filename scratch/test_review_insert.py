import urllib.request, json, ssl, urllib.error
import time

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

SUPA_URL = "https://erqoyvbuhmkyvcqgwcbz.supabase.co"
ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw"

def test_insert():
    headers = {
        "apikey": ANON_KEY,
        "Authorization": f"Bearer {ANON_KEY}",
        "Content-Type": "application/json",
        "Prefer": "return=representation"
    }

    body = json.dumps({
        "reviewer_name": "Test Script",
        "reviewer_email": "test@script.com",
        "rating": 5,
        "comment": "Testing the submission trigger.",
        "pros": ["Pro A", "Pro B"],
        "cons": ["Con A"],
        "recommend": True,
        "media_urls": [],
        "title": "Role Test",
        "status": "approved"
    }).encode()

    req = urllib.request.Request(
        f"{SUPA_URL}/rest/v1/reviews",
        data=body, headers=headers, method="POST"
    )

    try:
        print("Sending insert request to Supabase...")
        with urllib.request.urlopen(req, context=ctx) as r:
            print(f"Status: {r.status}")
            print(f"Response: {r.read().decode()}")
    except urllib.error.HTTPError as e:
        print(f"HTTP Error {e.code}:")
        print(e.read().decode())
    except Exception as e:
        print(f"General Error: {e}")

if __name__ == "__main__":
    test_insert()
