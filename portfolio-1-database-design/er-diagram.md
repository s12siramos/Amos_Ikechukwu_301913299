# Entity Relationship Diagram

```mermaid
erDiagram
    DEPARTMENTS ||--o{ DOCTORS : contains
    PATIENTS ||--o{ APPOINTMENTS : books
    DOCTORS ||--o{ APPOINTMENTS : attends
    APPOINTMENTS ||--o| MEDICAL_RECORDS : creates
    MEDICAL_RECORDS ||--o{ PRESCRIPTIONS : includes
    MEDICATIONS ||--o{ PRESCRIPTIONS : is_prescribed_in
    MEDICAL_RECORDS ||--o{ LAB_TEST_REQUESTS : requests
    LAB_TEST_TYPES ||--o{ LAB_TEST_REQUESTS : classifies

    DEPARTMENTS {
        bigint department_id PK
        varchar department_name UK
    }
    DOCTORS {
        bigint doctor_id PK
        bigint department_id FK
        varchar licence_number UK
    }
    PATIENTS {
        bigint patient_id PK
        varchar patient_number UK
    }
    APPOINTMENTS {
        bigint appointment_id PK
        bigint patient_id FK
        bigint doctor_id FK
        date appointment_date
        time appointment_time
    }
    MEDICAL_RECORDS {
        bigint record_id PK
        bigint appointment_id FK
        text diagnosis
    }
    MEDICATIONS {
        bigint medication_id PK
        varchar medication_name
    }
    PRESCRIPTIONS {
        bigint prescription_id PK
        bigint record_id FK
        bigint medication_id FK
    }
    LAB_TEST_TYPES {
        bigint test_type_id PK
        varchar test_name UK
    }
    LAB_TEST_REQUESTS {
        bigint lab_request_id PK
        bigint record_id FK
        bigint test_type_id FK
    }
```

## Reading the diagram

`||--o{` means **one-to-many**. For example, one patient can book many
appointments, but each appointment belongs to one patient. `||--o|` means
**one-to-zero-or-one**: an appointment may not yet have a medical record, but
when it does, that record belongs to only that appointment.
