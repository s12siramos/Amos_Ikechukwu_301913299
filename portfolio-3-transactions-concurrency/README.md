\# Portfolio 3: Transactions and Concurrency



This portfolio demonstrates transaction control and concurrency protection for the MIVA Care Clinic Management System.



\## Transaction rollback



The `01\_transaction\_rollback.sql` script creates a temporary appointment inside a transaction, then uses `ROLLBACK`. The final count of zero proves that the appointment was not permanently saved.



\## Transaction commit



The `02\_transaction\_commit.sql` script creates an appointment inside a transaction, then uses `COMMIT`. The final count of one proves that the appointment was permanently saved.



\## Concurrency control



Two PostgreSQL sessions attempted to work with the same committed appointment. Window A used `SELECT ... FOR UPDATE` to lock the appointment row. Window B attempted to update that appointment and waited until Window A committed the transaction.



This demonstrates row-level locking. The lock prevents two users from changing the same appointment record at the same time and helps protect data consistency.



\## Isolation level



The demonstration used PostgreSQL's default `READ COMMITTED` isolation level. At this level, the `FOR UPDATE` lock ensures that a competing update waits until the first transaction finishes.

