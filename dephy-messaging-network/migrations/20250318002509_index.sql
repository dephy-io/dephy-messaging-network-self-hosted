CREATE INDEX CONCURRENTLY idx_session_mention_id ON events (session, mention, id);
CREATE INDEX CONCURRENTLY idx_session_id ON events (session, id);
CREATE INDEX CONCURRENTLY idx_mention_id ON events (mention, id);
CREATE INDEX CONCURRENTLY idx_created_at_id ON events (created_at, id);
