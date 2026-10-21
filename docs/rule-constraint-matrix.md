# Rule-to-Constraint Matrix

## Purpose
This matrix maps the five proposed business rules to their corresponding PostgreSQL constraints and negative test cases.

| Rule ID | Business Rule | Database Enforcement | Negative Test |
|---|---|---|---|
| BR-01 | Every student must have a unique, non-null email address. | `NOT NULL` and `UNIQUE` constraints on `students.email`. | Insert a student using an existing email address. |
| BR-02 | An internship's end date cannot precede its start date. | `CHECK (end_date >= start_date)` on the `internships` table. | Insert an internship with an end date earlier than its start date. |
| BR-03 | A student can apply to the same internship only once. | `UNIQUE (student_id, internship_id)` on the `applications` table. | Insert a duplicate application for the same student and internship. |
| BR-04 | Every application must reference an existing student and internship, and every milestone must reference an existing application. | Foreign keys on `applications.student_id`, `applications.internship_id`, and `milestones.application_id`. | Insert an application referencing a nonexistent student. |
| BR-05 | Milestone status must be consistent with its submission timestamp. | A `CHECK` constraint on `milestones.status` and `milestones.submitted_at`. | Attempt to approve a milestone without a submission timestamp. |

## Validation Results

The negative SQL tests were executed against the PostgreSQL database. All five invalid operations returned constraint errors as expected.

## Implementation Files

- Schema migration: `migrations/001_initial_schema.sql`
- Sample fixtures: `fixtures/seed.sql`
- Negative tests: `tests/negative_tests.sql`
- Business rules: `docs/business-rules.md`
- ER diagram: `docs/er-diagram.mmd`

## Important Note

The constraints must be present in the actual database schema for the corresponding rules to be enforced. In particular, BR-05 requires a `CHECK` constraint that explicitly validates the relationship between milestone status and submission timestamp.

These rules are proposed for this internship-management model and should be verified against the original business brief.