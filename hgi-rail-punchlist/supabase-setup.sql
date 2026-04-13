-- Run this in Supabase SQL Editor (supabase.com > your project > SQL Editor)

-- 1. Create the table
CREATE TABLE punch_items (
  id TEXT PRIMARY KEY,
  section TEXT NOT NULL,
  item TEXT NOT NULL,
  done_initials TEXT DEFAULT '',
  done_at TEXT DEFAULT '',
  approved_initials TEXT DEFAULT '',
  approved_at TEXT DEFAULT ''
);

-- 2. Seed the default rows
INSERT INTO punch_items (id, section, item) VALUES
  ('bench-1', 'Bench / TC', 'Furnish 18 additional angle clips.'),
  ('bench-2', 'Bench / TC', 'Ensure all 52 clips are hot-dip galvanized and welded to the bench legs.'),
  ('bench-3', 'Bench / TC', 'Redo weak welds at the corner bench connections.'),
  ('bench-4', 'Bench / TC', 'Cut tubing as needed so benches meet flush with no gaps.'),
  ('bench-5', 'Bench / TC', 'Grind smooth all weld points.'),
  ('bench-6', 'Bench / TC', 'Apply galvanized coating to all finished weld areas.'),
  ('rail-1', 'Railings', 'Ensure uniform welds at all accessible rail tubing connections and post caps.'),
  ('rail-2', 'Railings', 'Wire brush or flap-wheel buff all weld points smooth.'),
  ('rail-3', 'Railings', 'Eliminate any sharp or unsafe edges at post caps that could injure hands.'),
  ('rail-4', 'Railings', 'Weld cut through-bolts to posts with galvanized washers.'),
  ('rail-5', 'Railings', 'Apply galvanized base coat to all weld points.'),
  ('rail-6', 'Railings', 'Apply shiny metallic top coat for a uniform finish.'),
  ('rail-7', 'Railings', 'Clean and prep all rails to ensure proper coating adhesion and consistent appearance.');

-- 3. Enable Row Level Security with open access (private domain, security by obscurity)
ALTER TABLE punch_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow public read"  ON punch_items FOR SELECT USING (true);
CREATE POLICY "Allow public write" ON punch_items FOR UPDATE USING (true) WITH CHECK (true);

-- 4. Enable Realtime on this table
-- Go to: Database > Replication > toggle "punch_items" ON
-- Or run:
ALTER PUBLICATION supabase_realtime ADD TABLE punch_items;
