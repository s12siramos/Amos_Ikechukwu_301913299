# Amos Ikechukwu 301913299

## MIVA Care Clinic Management System

This repository contains my Advanced Database Systems portfolio for the MIVA Care Clinic Management System. The project uses a fictional clinic case study to demonstrate relational database design, SQL optimisation, transactions, NoSQL data modelling, cloud database deployment, backup verification, and technical documentation.

All patient names, doctor names, appointment records, consultation details, prescriptions, and laboratory results are fictional and were created only for academic demonstration.

## Selected Case Study

MIVA Care Clinic is a small-to-medium healthcare provider that requires a reliable system for patient registration, doctor management, appointment scheduling, diagnoses, prescriptions, laboratory results, and consultation records.

The same case study was used consistently across all five portfolio activities.

## Technologies Used

- PostgreSQL 16
- MongoDB 8
- MongoDB Atlas on AWS
- Docker Desktop and Docker Compose
- PowerShell
- SQL and JavaScript
- Git and GitHub

## Summary of Work

### Portfolio 1 Database Design and Modelling

A relational database design was created for the clinic system. This includes an entity relationship diagram, relational schema, primary keys, foreign keys, constraints, and a normalisation explanation.

The design models patients, doctors, appointments, consultations, prescriptions, and laboratory-test information. Constraints were used to protect data quality and preserve valid relationships between records.

### Portfolio 2 Query Processing and Optimisation

Operational SQL queries were created for the clinic database. A benchmark dataset of 50,000 fictional appointment records was generated to evaluate query performance.

A composite index was created on appointment status and appointment date. PostgreSQL execution plans showed that the database changed from a sequential scan to a Bitmap Index Scan and Bitmap Heap Scan, reducing unnecessary table-data access.

### Portfolio 3 Transactions and Concurrency

Transaction handling was demonstrated with both ROLLBACK and COMMIT operations.

A rollback test proved that an inserted appointment was removed when the transaction was cancelled. A commit test proved that an appointment was permanently saved. Concurrency control was demonstrated using two PostgreSQL sessions and `SELECT FOR UPDATE`, showing that a competing update waits until the row lock is released.

### Portfolio 4 NoSQL and Advanced Data Models

MongoDB was used to model complete clinic consultation records as documents.

Each consultation document contains embedded patient details, doctor details, appointment information, diagnosis, clinical notes, prescriptions, and laboratory-test records. An index was created on `patient.patientNumber` to support faster consultation-history lookups.

### Portfolio 5 Distributed and Cloud Database Exercise

The consultation model was deployed to MongoDB Atlas on AWS in the Paris region (`eu-west-3`).

The Atlas deployment uses a three-node replica set. This supports higher availability because data is replicated across nodes and an eligible secondary can become primary if the current primary is unavailable. Two fictional consultation records and a patient-number index were created in the cloud database.

## Additional Backup and Recovery Evidence

An additional PostgreSQL backup-and-recovery exercise was completed. A custom-format backup was created with `pg_dump` and restored into a separate verification database. The restored database confirmed 5 patients, 3 doctors, and 50,007 appointments.

## Repository Structure

- `portfolio-1-database-design/` - ER diagram, relational schema, constraints, and normalisation.
- `portfolio-2-query-optimisation/` - SQL queries, benchmark data, indexes, execution plans, and analysis.
- `portfolio-3-transactions-concurrency/` - COMMIT, ROLLBACK, locking, and concurrency evidence.
- `portfolio-4-nosql/` - MongoDB consultation document model and evidence.
- `portfolio-5-distributed-cloud/` - MongoDB Atlas cloud deployment and replica-set evidence.
- `portfolio-5-backup-recovery/` - PostgreSQL backup and restore verification.
- `final-documentation/` - detailed summary, reflection, references, and AI-use declaration.

## Documentation

- [Final Portfolio Summary](final-documentation/FINAL_PORTFOLIO_SUMMARY.md)
- [AI Use and Sources Declaration](final-documentation/AI_USE_AND_SOURCES_DECLARATION.md)

## References

- PostgreSQL Documentation: https://www.postgresql.org/docs/
- MongoDB Manual: https://www.mongodb.com/docs/manual/
- MongoDB Atlas Documentation: https://www.mongodb.com/docs/atlas/
- Docker Documentation: https://docs.docker.com/

## AI Use Declaration

AI tools were used to support learning, clarify database concepts, organise explanations, and improve documentation. All practical database work, Docker commands, MongoDB Atlas configuration, screenshots, Git commits, and GitHub uploads were completed and verified by me.