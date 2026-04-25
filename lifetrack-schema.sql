-- ============================================
--  LifeTrack — Supabase Schema
--  Paste into: Supabase Dashboard → SQL Editor → Run
-- ============================================

create table if not exists lt_expenses (
  id text primary key,
  name text not null,
  amount numeric not null default 0,
  date text,
  category text default 'Other',
  note text,
  created_at timestamptz default now()
);

create table if not exists lt_income (
  id text primary key,
  source text not null,
  amount numeric not null default 0,
  date text,
  category text default 'Income',
  created_at timestamptz default now()
);

create table if not exists lt_tasks (
  id text primary key,
  title text not null,
  description text,
  priority text default 'medium',
  status text default 'pending',
  due_date text,
  category text,
  created_at timestamptz default now()
);

create table if not exists lt_habits (
  id text primary key,
  name text not null,
  icon text default '⭐',
  created_at timestamptz default now()
);

create table if not exists lt_habit_logs (
  id text primary key,
  habit_id text not null,
  log_date text not null,
  value numeric default 1,
  created_at timestamptz default now()
);

create table if not exists lt_schedule (
  id text primary key,
  title text not null,
  event_date text not null,
  time text,
  tag text,
  notes text,
  done boolean default false,
  created_at timestamptz default now()
);

create table if not exists lt_reminders (
  id text primary key,
  text text not null,
  due_at timestamptz,
  urgent boolean default false,
  done boolean default false,
  created_at timestamptz default now()
);

create table if not exists lt_settings_store (
  id text primary key default 'main',
  name text,
  currency text default 'JMD $',
  monthly_budget numeric default 80000,
  water_goal integer default 8,
  sleep_goal numeric default 8,
  updated_at timestamptz default now()
);

-- ============================================
--  ROW LEVEL SECURITY
-- ============================================
alter table lt_expenses      enable row level security;
alter table lt_income        enable row level security;
alter table lt_tasks         enable row level security;
alter table lt_habits        enable row level security;
alter table lt_habit_logs    enable row level security;
alter table lt_schedule      enable row level security;
alter table lt_reminders     enable row level security;
alter table lt_settings_store enable row level security;

create policy "open_lt_expenses"       on lt_expenses       for all using (true) with check (true);
create policy "open_lt_income"         on lt_income         for all using (true) with check (true);
create policy "open_lt_tasks"          on lt_tasks          for all using (true) with check (true);
create policy "open_lt_habits"         on lt_habits         for all using (true) with check (true);
create policy "open_lt_habit_logs"     on lt_habit_logs     for all using (true) with check (true);
create policy "open_lt_schedule"       on lt_schedule       for all using (true) with check (true);
create policy "open_lt_reminders"      on lt_reminders      for all using (true) with check (true);
create policy "open_lt_settings_store" on lt_settings_store for all using (true) with check (true);
