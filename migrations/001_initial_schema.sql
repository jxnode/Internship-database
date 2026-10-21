CREATE TABLE students (
    student_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE internships (
    internship_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL
        CHECK (status IN ('DRAFT', 'OPEN', 'CLOSED')),
    CHECK (end_date >= start_date)
);

CREATE TABLE applications (
    application_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id BIGINT NOT NULL REFERENCES students(student_id),
    internship_id BIGINT NOT NULL REFERENCES internships(internship_id),
    status VARCHAR(20) NOT NULL DEFAULT 'APPLIED'
        CHECK (status IN ('APPLIED', 'ACCEPTED', 'REJECTED', 'WITHDRAWN')),
    applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (student_id, internship_id)
);

CREATE TABLE milestones (
    milestone_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    application_id BIGINT NOT NULL REFERENCES applications(application_id),
    title VARCHAR(150) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING'
        CHECK (status IN ('PENDING', 'SUBMITTED', 'APPROVED', 'REJECTED')),
    submitted_at TIMESTAMPTZ,
    CHECK (
        (status IN ('PENDING', 'REJECTED') AND submitted_at IS NULL)
        OR
        (status IN ('SUBMITTED', 'APPROVED') AND submitted_at IS NOT NULL)
    )
);