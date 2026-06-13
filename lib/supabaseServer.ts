import { cookies } from 'next/headers';
import { createServerClient } from '@supabase/ssr';

const SUPABASE_URL = 'https://erqoyvbuhmkyvcqgwcbz.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVycW95dmJ1aG1reXZjcWd3Y2J6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzODk1MTIsImV4cCI6MjA5NDk2NTUxMn0.9UnIfq8xMrKANPPTtoOADKH-NJ_it9HDp7xrJL4FXtw';

/**
 * Creates a fully validated server-side Supabase client using @supabase/ssr.
 * - Reads ALL Supabase v2 cookies (sb-<ref>-auth-token format) correctly.
 * - supabase.auth.getUser() makes a live network call to validate the JWT
 *   with the Supabase Auth server — cannot be spoofed by cookie forgery.
 * - Safe to use inside Next.js Server Components, Server Actions, Route Handlers.
 */
export function getSupabaseServerClient() {
  const cookieStore = cookies();

  return createServerClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
    cookies: {
      getAll() {
        return cookieStore.getAll();
      },
      // Server Components are read-only; cookie setting is a no-op here
      setAll() {},
    },
  });
}
