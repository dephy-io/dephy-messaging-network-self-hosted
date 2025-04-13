ALTER TABLE events ADD COLUMN expires_at bigint;

CREATE INDEX IF NOT EXISTS idx_events_expires_at ON events (expires_at);
