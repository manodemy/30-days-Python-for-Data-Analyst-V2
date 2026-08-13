import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';
import { createServerClient } from '@supabase/ssr';

const SUPABASE_URL = 'https://erqoyvbuhmkyvcqgwcbz.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw';

export async function GET(request: NextRequest) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get('code');
  const next = searchParams.get('next') || '/home.html';

  // Ensure redirect target is a safe relative path or matching origin
  const safeNext = next.startsWith('/') ? next : '/home.html';

  if (code) {
    const response = NextResponse.redirect(new URL(safeNext, origin));

    const supabase = createServerClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => {
            response.cookies.set(name, value, {
              ...options,
              sameSite: 'lax',
              secure: process.env.NODE_ENV === 'production' || origin.startsWith('https')
            });
          });
        },
      },
    });

    try {
      const { data, error } = await supabase.auth.exchangeCodeForSession(code);
      if (!error && data?.session) {
        // Also set standard legacy sb-access-token cookie for backwards compatibility with static html scripts
        const accessToken = data.session.access_token;
        const maxAge = data.session.expires_in || 604800;
        const isSecure = process.env.NODE_ENV === 'production' || origin.startsWith('https');

        response.cookies.set('sb-access-token', accessToken, {
          path: '/',
          maxAge: maxAge,
          sameSite: 'lax',
          secure: isSecure
        });

        // If user is admin, route to admin portal
        const userEmail = (data.session.user.email || '').toLowerCase();
        const isAdmin = userEmail === 'manodamy25@gmail.com' || userEmail.includes('manodemy') || userEmail.includes('manodamy');
        if (isAdmin && safeNext === '/home.html') {
          return NextResponse.redirect(new URL('/admin.html', origin));
        }

        return response;
      }
    } catch (err) {
      console.error('[Auth Callback] Code exchange failed:', err);
    }
  }

  // Fallback if no code or exchange failed
  return NextResponse.redirect(new URL('/landing_v2/index.html?reason=auth_failed', origin));
}
