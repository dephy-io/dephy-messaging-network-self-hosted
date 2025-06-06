ALTER TABLE events ADD COLUMN relay_signed character varying;
ALTER TABLE events ADD COLUMN discovered_at_ms bigint;
CREATE INDEX IF NOT EXISTS idx_session_discovered_at_ms_id ON events (session, discovered_at_ms, id);
