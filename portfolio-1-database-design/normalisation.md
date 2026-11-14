\# Database Normalisation Explanation



\## First Normal Form (1NF)



The MIVA Care Clinic database satisfies First Normal Form because each table has a primary key and each column stores one single value. For example, the `patients` table stores one phone number per field, while each prescription is stored as a separate row in the `prescriptions` table. There are no repeating groups such as Medicine1, Medicine2, or Medicine3.



\## Second Normal Form (2NF)



The database satisfies Second Normal Form because non-key attributes depend on the complete primary key of their table. For example, patient details such as first name, date of birth, and phone number depend only on `patient\_id`. Doctor details depend only on `doctor\_id`. Appointment information depends only on `appointment\_id`.



\## Third Normal Form (3NF)



The database satisfies Third Normal Form because non-key attributes do not depend on other non-key attributes. For example, department details are stored in the `departments` table rather than repeated for every doctor. Medication details are stored in the `medications` table rather than repeated inside every prescription. Laboratory test names are stored in `lab\_test\_types` rather than repeated in every laboratory request.



\## Benefits of Normalisation



Normalisation reduces duplicate data, prevents inconsistent records, and makes updates safer. For example, if a medication strength changes, it is updated once in the `medications` table rather than in many prescription records. This improves data integrity and makes the clinic database easier to maintain.

