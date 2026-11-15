\# Portfolio 4: NoSQL and Advanced Data Models



This portfolio demonstrates a MongoDB document model for consultation records in the MIVA Care Clinic Management System.



\## Technology used



\- MongoDB 8 running in Docker

\- MongoDB Shell (`mongosh`)

\- JavaScript scripts for document creation, querying, and indexing



\## Document model



Each consultation is stored as one MongoDB document. It includes:



\- patient details;

\- doctor details;

\- appointment details;

\- diagnosis and clinical notes;

\- embedded prescription records;

\- embedded laboratory-test records.



This design is appropriate because a consultation is commonly viewed as one complete clinical record. MongoDB can retrieve the patient consultation, its medicines, and test details in a single query.



\## Scripts



\- `mongodb/01\_insert\_consultation\_documents.js` — creates two fictional consultation documents.

\- `mongodb/02\_query\_consultation\_document.js` — retrieves Tunde Bello's complete consultation document.

\- `mongodb/03\_create\_patient\_index.js` — creates `idx\_patient\_number` for faster patient consultation lookups.

\- `docker-compose.yml` — runs MongoDB in Docker.



\## Indexing



The `idx\_patient\_number` index was created on:



```javascript

{ "patient.patientNumber": 1 }

```



This supports quicker searches for a patient's consultation history.



\## Evidence



The `evidence/` folder contains screenshots proving that MongoDB was running, documents were inserted, a complete embedded consultation document was retrieved, and the patient lookup index was created.

