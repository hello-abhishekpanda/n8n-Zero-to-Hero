-- Part 9: Business database schema
-- Run this while connected to the `business` database.

CREATE TABLE IF NOT EXISTS public.customers (
    id BIGSERIAL PRIMARY KEY,
    request_id VARCHAR(100) NOT NULL,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(320) NOT NULL,
    company VARCHAR(200) NOT NULL,
    budget NUMERIC(15,2),
    employees INTEGER,
    timeline_months INTEGER,
    status VARCHAR(50) NOT NULL DEFAULT 'NEW',
    source VARCHAR(100),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_customers_email UNIQUE (email)
);

CREATE INDEX IF NOT EXISTS ix_customers_company
ON public.customers(company);

CREATE INDEX IF NOT EXISTS ix_customers_status
ON public.customers(status);

CREATE TABLE IF NOT EXISTS public.customer_audit (
    id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT REFERENCES public.customers(id) ON DELETE SET NULL,
    request_id VARCHAR(100),
    event_type VARCHAR(100) NOT NULL,
    event_data JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS ix_customer_audit_customer_id
ON public.customer_audit(customer_id);

CREATE INDEX IF NOT EXISTS ix_customer_audit_request_id
ON public.customer_audit(request_id);
