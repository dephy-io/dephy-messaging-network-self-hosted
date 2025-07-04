CREATE TABLE IF NOT EXISTS workers (
    id bigserial PRIMARY KEY,
    pubkey character varying NOT NULL,
    uptime bigint NOT NULL,
    status integer NOT NULL,
    created_at bigint NOT NULL,
    updated_at bigint NOT NULL,

    CONSTRAINT workers_unique_pubkey UNIQUE (pubkey)
);

CREATE TABLE IF NOT EXISTS online_proofs (
    id bigserial PRIMARY KEY,
    worker_pubkey character varying NOT NULL,
    start_event_id character varying NOT NULL,
    start_event_type integer NOT NULL,
    started_at bigint NOT NULL,
    pinged_at bigint,
    response_event_id character varying,
    response_event_type integer,
    responded_at bigint,

    CONSTRAINT online_proofs_unique_worker_pubkey UNIQUE (worker_pubkey),

    CONSTRAINT online_proofs_fk_worker_pubkey
    FOREIGN KEY (worker_pubkey) REFERENCES workers (pubkey)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS received_events (
    id bigserial PRIMARY KEY,
    event_id character varying NOT NULL,
    created_at bigint NOT NULL,
    is_processed boolean NOT NULL
);
