CREATE TABLE IF NOT EXISTS workers (
    id bigserial PRIMARY KEY,
    pubkey character varying NOT NULL,
    uptime bigint NOT NULL,
    status integer NOT NULL,
    created_at bigint NOT NULL,
    updated_at bigint NOT NULL,
    ping_loop_pinged boolean NOT NULL,
    "version" character varying NOT NULL,
    backend jsonb NOT NULL,
    topic character varying NOT NULL,

    CONSTRAINT workers_unique_pubkey UNIQUE (pubkey)
);

CREATE TABLE IF NOT EXISTS worker_tasks (
    id bigserial PRIMARY KEY,
    worker_pubkey character varying NOT NULL,
    status integer NOT NULL,
    expires_at bigint NOT NULL,
    request_event_id character varying NOT NULL,
    request_timeout_event_id character varying,
    result_event_id character varying,

    CONSTRAINT worker_tasks_unique_request_event_id UNIQUE (request_event_id),

    CONSTRAINT worker_tasks_fk_worker_pubkey
    FOREIGN KEY (worker_pubkey) REFERENCES workers (pubkey)
    ON DELETE CASCADE
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
