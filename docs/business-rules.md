# Business Rules to Executable Relational Model

## Entities
- Students
- Internships
- Applications
- Milestones

## Relationships
- One student can submit multiple applications.
- One internship can receive multiple applications.
- One application can contain multiple milestones.

## States
- Internship: DRAFT, OPEN, CLOSED
- Application: APPLIED, ACCEPTED, REJECTED, WITHDRAWN
- Milestone: PENDING, SUBMITTED, APPROVED, REJECTED

## Retention Requirements
Proposed policy: retain internship and application records for
the period required by the organization and applicable law.
Do not delete records until the retention policy is confirmed.

## Five Non-Negotiable Rules
1. Every student must have a unique email.
2. Internship end date cannot precede its start date.
3. A student may apply to an internship only once.
4. Every application must reference an existing student and internship.
5. Milestone status must be consistent with its submission timestamp.