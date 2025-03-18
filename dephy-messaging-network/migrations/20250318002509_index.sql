CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_mention_id ON events (session, mention, id);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_pubkey_id ON events (session, pubkey, id);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_id ON events (session, id);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_created_at_id ON events (session, created_at, id);
