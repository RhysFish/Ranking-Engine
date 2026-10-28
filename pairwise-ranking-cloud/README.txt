PAIRWISE RANKING — CLOUD SETUP

This version adds Supabase cloud storage with email/password accounts. It retains the existing ranking UI, binary insertion, JSON import/export, and local IndexedDB backup.

1. Create a project at https://supabase.com/.
2. In the project dashboard, open SQL Editor, paste the contents of setup.sql, and run it. The table is protected by Row Level Security so each signed-in user can access only their own session.
3. In Supabase project settings/API (or the Connect dialog), copy the Project URL and the publishable key. Do NOT use a service_role or secret key in a browser file.
4. Edit cloud-config.js and replace YOUR_PROJECT_REF and YOUR_SUPABASE_PUBLISHABLE_KEY with your project's values.
5. Test locally: serve this folder with a local web server (recommended) or publish it using GitHub Pages. Supabase's browser SDK is loaded from a CDN.
6. Open the website, create an account with an email and password, and confirm the email if Supabase asks you to. Then sign in. Your current local ranking is uploaded if the cloud account has no saved session; otherwise the cloud session is restored.
7. Open the same published website on another device and sign in with the same account. It loads your cloud ranking and checks for changes while open.

PUBLISH WITH GITHUB PAGES
- Create a GitHub repository and upload index.html, cloud-config.js, and setup.sql (README optional).
- In repository Settings > Pages, publish from the main branch and root folder.
- Set the published URL as an allowed redirect URL in Supabase Authentication > URL Configuration if needed.

IMPORTANT
- This stores one current ranking session per account. Export JSON backups for important work.
- IndexedDB remains as a local backup. Cloud syncing requires internet access and a configured Supabase project.
- The publishable key is designed for browser use, but the database's RLS policies are essential. Never expose a secret/service_role key.
- Concurrent edits on two devices are not a collaborative merge; the last saved session can replace the other. For safety, avoid editing the same ranking simultaneously on multiple devices.
- Supabase email confirmation settings may require checking your email before the first sign-in.
