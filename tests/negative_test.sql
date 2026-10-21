-- Negative Test 1: Duplicate student email must fail.
INSERT INTO students (full_name, email)
VALUES ('Duplicate Student', 'arun@example.com');


-- Negative Test 2: Invalid internship dates must fail.
INSERT INTO internships
    (title, start_date, end_date, status)
VALUES
    ('Invalid Dates', '2026-12-31', '2026-12-01', 'OPEN');


-- Negative Test 3: Application referencing a missing student must fail.
INSERT INTO applications
    (student_id, internship_id, status)
VALUES (999999, 1, 'APPLIED');


-- Negative Test 4: Duplicate application must fail.
INSERT INTO applications
    (student_id, internship_id, status)
VALUES (1, 1, 'ACCEPTED');


-- Negative Test 5: Approved milestone without a submission timestamp must fail.
INSERT INTO milestones
    (application_id, title, status, submitted_at)
VALUES (1, 'Invalid Approval', 'APPROVED', NULL);