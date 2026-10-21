INSERT INTO students (full_name, email) VALUES
('Arun Kumar', 'arun@example.com'),
('Priya Nair', 'priya@example.com'),
('Rahul Das', 'rahul@example.com');

INSERT INTO internships
(title, start_date, end_date, status) VALUES
('SQL & Database Engineering',
 '2026-10-22', '2026-10-23', 'OPEN'),
('Data Analytics',
 '2026-10-22', '2026-10-23', 'OPEN');

INSERT INTO applications
(student_id, internship_id, status) VALUES
(1, 1, 'ACCEPTED'),
(2, 1, 'APPLIED'),
(3, 2, 'ACCEPTED');

INSERT INTO milestones
(application_id, title, status) VALUES
(1, 'Design ER diagram', 'PENDING'),
(1, 'Create database schema', 'PENDING'),
(3, 'Complete analytics project', 'PENDING');
