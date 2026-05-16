# Supabase Integration & Setup Checklist

After running `004_admin_analytics.sql` in the Supabase SQL Editor, please complete the following 10 manual steps in the Supabase Dashboard to ensure the Analytics Dashboard functions correctly:

1. **Verify Table Creation**: Navigate to the **Table Editor** and verify that `purchases`, `coupons`, `admin_audit_log`, and `activity_logs` tables have been successfully created.
2. **Verify View Creation**: In the **Table Editor**, ensure that the `bd_daily_revenue` view is listed and accessible.
3. **Enable RLS on New Tables**: Go to **Authentication > Policies**. Verify that Row Level Security (RLS) is active for `purchases` and `coupons`. If they show as "Disabled", manually enable them.
4. **Review RLS Policies**: Check that the generated policies strictly enforce the `admin` role constraint. Test by attempting to insert data into `purchases` as an unauthenticated or standard user (it should be denied).
5. **Whitelist the View**: If you are using Supabase API (PostgREST) to query the `bd_daily_revenue` view from the client, ensure the view is accessible. You might need to grant `SELECT` permissions to the `authenticated` role if PostgREST requires it, though admins bypass RLS via the `profiles` check.
6. **Seed Test Purchase Data**: Manually insert 3-5 test rows into the `purchases` table using the Table Editor to ensure the "Revenue Intelligence" and "Growth" tabs have initial data to render. Include at least one `USD` and one `refunded` transaction.
7. **Seed Test Coupon Data**: Manually insert a test coupon into the `coupons` table to verify that the "Coupons & Pricing" tab correctly loads active coupons.
8. **Verify Trigger Execution**: Go to the **Table Editor** for `coupons` and insert/update a row. Then, check the `admin_audit_log` table to ensure a new record was successfully created with the correct `admin_id` and JSON payload.
9. **Update CORS/Domain Settings**: If you are deploying `admin.html` to a new domain, ensure that domain is added to the allowed origins under **Authentication > URL Configuration** in Supabase to allow OAuth and API access.
10. **Test with Admin Account**: Log into `admin.html` with an account that has `role = 'admin'` in the `profiles` table. Ensure that all 5 tabs load without console errors and that the date filter updates the charts properly.
