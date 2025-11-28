ALTER TABLE events ADD COLUMN referenced_event character varying;
CREATE INDEX IF NOT EXISTS idx_session_referenced_event_id ON events (session, referenced_event, id);
