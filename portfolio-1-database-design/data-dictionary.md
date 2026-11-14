# Data Dictionary and Business Rules

| Table | Purpose | Primary key | Important relationships/rules |
|---|---|---|---|
| `departments` | Clinic units such as Pediatrics | `department_id` | Department name must be unique. |
| `doctors` | Doctors employed by the clinic | `doctor_id` | Each doctor belongs to one department. Medical licence number and email are unique. |
| `patients` | Registered clinic patients | `patient_id` | Patient number is unique. Date of birth cannot be in the future. |
| `appointments` | A scheduled visit between a patient and doctor | `appointment_id` | Links one patient to one doctor. A doctor cannot have two appointments at the same date and time. |
| `medical_records` | Diagnosis and clinical notes for an appointment | `record_id` | Each appointment can have at most one medical record. |
| `medications` | Catalogue of medicines | `medication_id` | Medication name and strength together are unique. |
| `prescriptions` | Medicines prescribed during a medical record | `prescription_id` | Links a medical record to a medication. Dose, frequency, and duration are required. |
| `lab_test_types` | Catalogue of test types | `test_type_id` | Test name must be unique. |
| `lab_test_requests` | Requested tests and results | `lab_request_id` | Links a medical record to a test type and tracks requested/completed status. |

## Key ideas

- A **primary key** is like a unique file number. No two rows can share it.
- A **foreign key** is like a paperclip between two files. It ensures a linked record exists.
- A **constraint** is a safety rule, such as preventing an invalid appointment status.
