create table if not exists public.ranking_sessions (
  user_id uuid primary key references auth.users(id) on delete cascade,
  session_data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.ranking_sessions enable row level security;
revoke all on public.ranking_sessions from anon;
grant select, insert, update, delete on public.ranking_sessions to authenticated;

drop policy if exists "Users can read their own ranking session" on public.ranking_sessions;
create policy "Users can read their own ranking session" on public.ranking_sessions for select to authenticated using (auth.uid() = user_id);
drop policy if exists "Users can insert their own ranking session" on public.ranking_sessions;
create policy "Users can insert their own ranking session" on public.ranking_sessions for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "Users can update their own ranking session" on public.ranking_sessions;
create policy "Users can update their own ranking session" on public.ranking_sessions for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "Users can delete their own ranking session" on public.ranking_sessions;
create policy "Users can delete their own ranking session" on public.ranking_sessions for delete to authenticated using (auth.uid() = user_id);
