CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_mention_id ON events (session, mention, id);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_pubkey_id_desc_include_event_id_created_at ON events (pubkey, session, id desc) include (event_id, created_at);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_id ON events (session, id);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_session_created_at_id ON events (session, created_at, id);
