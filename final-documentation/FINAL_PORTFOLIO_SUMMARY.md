\# MIVA Care Clinic Management System Portfolio Summary



\## Student Portfolio Overview



This portfolio presents the design, implementation, testing, and cloud deployment of the MIVA Care Clinic Management System database. The selected organisation is MIVA Care Clinic, a fictional healthcare provider created for this academic assessment.



The system was designed to support core clinic operations, including patient registration, doctor information, appointment scheduling, consultation records, prescriptions, laboratory tests, data protection, and cloud-hosted availability. All names, records, and clinical information used in the portfolio are fictional and were created only for academic demonstration.



GitHub repository: https://github.com/s12siramos/Amos\_Ikechukwu\_301913299



\## Portfolio 1 Database Design and Modelling



The first activity focused on designing a structured relational database for the clinic. An entity relationship diagram was created to show how patients, doctors, appointments, consultations, prescriptions, and laboratory tests relate to each other.



The relational schema used primary keys to identify records uniquely and foreign keys to maintain valid relationships between tables. Constraints were applied to prevent invalid data, such as duplicate patient numbers, invalid appointment statuses, and appointment records without linked patients or doctors.



The design was normalised to reduce duplicate data and improve maintainability. For example, patient information is stored once in the patients table, while appointments reference the patient through a foreign key. This structure supports accurate reporting and reduces the risk of inconsistent clinic data.



\## Portfolio 2 Query Processing and Optimisation



The second activity demonstrated practical SQL queries for clinic operations. Queries retrieved appointment records, patient information, and doctor-related data.



A benchmark dataset of 50,000 fictional appointments was generated to test query performance. Before optimisation, PostgreSQL used a sequential scan to find scheduled appointments for a selected date. A composite index was then created on appointment status and appointment date.



After indexing, PostgreSQL used a Bitmap Index Scan and Bitmap Heap Scan instead of scanning the entire appointments table. Although one single timing measurement did not show a reliable reduction, the execution plan confirmed that the database searched fewer data blocks. This demonstrated why indexes become increasingly important as a database grows.



\## Portfolio 3 Transactions and Concurrency



The third activity demonstrated safe transaction processing. A rollback example inserted an appointment inside a transaction and then removed it using ROLLBACK. The final count of zero proved that the appointment was not permanently saved.



A commit example inserted another appointment and permanently saved it using COMMIT. The final count of one proved that the transaction completed successfully.



Concurrency was demonstrated with two PostgreSQL sessions. The first session locked an appointment row using SELECT FOR UPDATE. The second session attempted to update the same appointment and waited until the first session committed. This showed how PostgreSQL row-level locking protects records from conflicting updates and helps maintain data consistency.



\## Portfolio 4 NoSQL and Advanced Data Models



The fourth activity implemented a MongoDB document model for clinic consultation records. Each consultation document contains patient details, doctor details, appointment information, diagnosis, clinical notes, prescriptions, and laboratory-test results.



MongoDB was suitable for this part of the system because the complete consultation can be retrieved in one document. The embedded prescription and laboratory-test arrays make the record flexible and reduce the need for multiple joins when viewing a patient consultation.



Two fictional consultation documents were inserted into MongoDB, and an index named idx\_patient\_number was created on patient.patientNumber. This supports faster retrieval of a patient’s consultation history.



\## Portfolio 5 Distributed and Cloud Database Exercise



The fifth activity deployed the consultation data model to MongoDB Atlas, a managed cloud database service. The cloud database is named miva\_care\_cloud and contains the consultations collection.



The deployment runs on AWS in the Paris region, eu-west-3, using a three-node MongoDB replica set. The replica-set configuration improves availability because database data is replicated across nodes. If the primary node becomes unavailable, an eligible secondary node can be elected as the new primary.



Two fictional consultation documents were inserted into the Atlas collection, and an index was created on patient.patientNumber. Sharding was discussed as a possible future approach if the clinic grows to store millions of records across multiple regions. The portfolio also identifies the need for strong database credentials, TLS encryption, IP access-list restrictions, least-privilege access, backups, and regular recovery testing.



\## Individual Reflection



This portfolio improved my understanding of how database concepts work together in a real system. I learned that good database design begins before writing SQL because entities, relationships, keys, and constraints determine the quality of the final system.



I also learned that query optimisation is not only about execution time. Execution plans reveal how the database searches for data and help identify when an index can reduce unnecessary work. The transaction and concurrency exercise showed why databases must protect records when multiple users work on the same appointment at the same time.



The NoSQL and cloud activities helped me compare relational and document databases. PostgreSQL was appropriate for structured clinic data and transactional integrity, while MongoDB was appropriate for flexible consultation documents. Deploying the consultation model to Atlas showed how managed cloud databases can provide replication and availability without manually operating every database server.



\## Selected Evidence



The repository includes ER diagrams, schema files, SQL queries, execution plans, optimisation screenshots, transaction screenshots, MongoDB document screenshots, PostgreSQL backup-and-recovery evidence, and MongoDB Atlas cloud deployment evidence.



Key cloud evidence shows an active AWS-hosted MongoDB Atlas Free deployment in the Paris region with a three-node replica set.



\## References



1\. PostgreSQL Global Development Group. PostgreSQL Documentation. https://www.postgresql.org/docs/



2\. MongoDB Inc. MongoDB Atlas Documentation. https://www.mongodb.com/docs/atlas/



3\. MongoDB Inc. MongoDB Manual. https://www.mongodb.com/docs/manual/



\## AI Use Declaration



AI tools were used to support learning, organise explanations, draft documentation, and clarify database concepts. All database scripts were reviewed and executed by the student. All screenshots, command outputs, practical demonstrations, and GitHub commits were produced and verified by the student.

