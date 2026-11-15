\# Portfolio 2: Query Processing and Optimisation



This portfolio demonstrates SQL query processing and index optimisation for the MIVA Care Clinic Management System.



\## Contents



\- `sql/01\_clinic\_queries.sql` — five operational clinic queries.

\- `sql/02\_generate\_benchmark\_data.sql` — 50,000 fictional appointments for performance testing.

\- `sql/03\_explain\_before\_index.sql` — execution plan before indexing.

\- `sql/04\_create\_optimisation\_index.sql` — composite index on appointment status and date.

\- `sql/05\_explain\_after\_index.sql` — execution plan after indexing.

\- `performance-analysis.md` — analysis of the query plans and measurements.

\- `evidence/` — screenshots of query outputs and execution plans.



\## Optimisation



The index `idx\_appointments\_status\_date` supports appointment searches filtered by appointment status and appointment date. PostgreSQL changed from a sequential scan to a Bitmap Index Scan after the index was created.

