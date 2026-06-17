import './init';
import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';
import { createServerClient } from '@supabase/ssr';

const SUPABASE_URL = 'https://erqoyvbuhmkyvcqgwcbz.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw';

// Premium days: 3–30 require authentication + enrollment
const PREMIUM_DAY_MIN = 3;
const PREMIUM_DAY_MAX = 30;

/**
 * Extracts the day number from a /notebook/dayXX path.
 * Returns null if the path is not a notebook day path.
 */
function extractNotebookDayNum(pathname: string): number | null {
  const match = pathname.match(/^\/notebook\/(?:sql-day|excel-day|day)(\d{1,2})(?:\/|$)/i);
  if (!match) return null;
  const num = parseInt(match[1], 10);
  return isNaN(num) ? null : num;
}

export async function middleware(request: NextRequest) {
  const url = request.nextUrl.clone();
  const path = url.pathname;

  // ── Layer A: Redirect legacy dayXX.html → /notebook/dayXX ──────────────────
  const legacyMatch = path.match(/^\/day(\d{2})\.html$/);
  if (legacyMatch) {
    const dayId = `day${legacyMatch[1]}`;
    const targetUrl = new URL(`/notebook/${dayId}`, request.url);
    return NextResponse.redirect(targetUrl, { status: 301 });
  }

  // ── Layer B: Edge Auth Guard for premium notebook routes ────────────────────
  const dayNum = extractNotebookDayNum(path);

  if (dayNum !== null && dayNum >= PREMIUM_DAY_MIN && dayNum <= PREMIUM_DAY_MAX) {
    // Build a response object so @supabase/ssr can refresh cookies if needed
    const response = NextResponse.next({ request });

    const supabase = createServerClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          // Propagate any refreshed auth cookies back to the browser
          cookiesToSet.forEach(({ name, value, options }) => {
            request.cookies.set(name, value);
            response.cookies.set(name, value, options);
          });
        },
      },
    });

    // getUser() validates the JWT with Supabase Auth servers — not just cookie presence.
    // This is the critical difference vs getSession() which only reads local cookies.
    const { data: { user }, error: authError } = await supabase.auth.getUser();

    if (authError || !user) {
      // Not authenticated → redirect to landing with the intended destination
      const redirectUrl = new URL('/landing_v2/index.html', request.url);
      redirectUrl.searchParams.set('redirect', path);
      return NextResponse.redirect(redirectUrl, { status: 302 });
    }

    // User IS authenticated. Enrollment check happens server-side in page.tsx
    // (requires a DB query — too slow for every Edge request; auth check is sufficient here)
    return response;
  }

  return NextResponse.next();
}

// Apply middleware to:
// 1. Legacy dayXX.html paths (for redirect)
// 2. /notebook/day* paths (for auth guard)
export const config = {
  matcher: [
    // Legacy HTML redirects (days 01–30)
    '/day01.html', '/day02.html', '/day03.html', '/day04.html', '/day05.html',
    '/day06.html', '/day07.html', '/day08.html', '/day09.html', '/day10.html',
    '/day11.html', '/day12.html', '/day13.html', '/day14.html', '/day15.html',
    '/day16.html', '/day17.html', '/day18.html', '/day19.html', '/day20.html',
    '/day21.html', '/day22.html', '/day23.html', '/day24.html', '/day25.html',
    '/day26.html', '/day27.html', '/day28.html', '/day29.html', '/day30.html',
    // Secure notebook routes (days 03–30 are premium)
    '/notebook/:path*',
  ],
};
