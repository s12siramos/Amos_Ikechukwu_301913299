-- Fictional sample data for the MIVA Care Clinic Management System.
-- This data is for academic demonstration only; it contains no real patient data.

BEGIN;

INSERT INTO departments (department_name, location, phone_extension) VALUES
    ('General Medicine', 'Block A, Ground Floor', '101'),
    ('Pediatrics', 'Block B, First Floor', '102'),
    ('Laboratory', 'Block C, Ground Floor', '103');

INSERT INTO doctors (department_id, first_name, last_name, speciality, licence_number, email, phone_number) VALUES
    ((SELECT department_id FROM departments WHERE department_name = 'General Medicine'), 'Adaeze', 'Okafor', 'Family Medicine', 'MCC-DR-1001', 'adaeze.okafor@mivacare.example', '+2348010001001'),
    ((SELECT department_id FROM departments WHERE department_name = 'Pediatrics'), 'Chinedu', 'Okoro', 'Pediatrics', 'MCC-DR-1002', 'chinedu.okoro@mivacare.example', '+2348010001002'),
    ((SELECT department_id FROM departments WHERE department_name = 'General Medicine'), 'Blessing', 'Daniel', 'Internal Medicine', 'MCC-DR-1003', 'blessing.daniel@mivacare.example', '+2348010001003');

INSERT INTO patients (
    patient_number, first_name, last_name, date_of_birth, gender, phone_number,
    email, home_address, emergency_contact_name, emergency_contact_phone
) VALUES
    ('MCC-P-0001', 'Amara', 'Eze', '1994-06-15', 'Female', '+2348020002001', 'amara.eze@example.test', 'Ikeja, Lagos', 'Chika Eze', '+2348030003001'),
    ('MCC-P-0002', 'Tunde', 'Bello', '1988-02-21', 'Male', '+2348020002002', 'tunde.bello@example.test', 'Yaba, Lagos', 'Sade Bello', '+2348030003002'),
    ('MCC-P-0003', 'Zainab', 'Ibrahim', '2016-09-03', 'Female', '+2348020002003', NULL, 'Surulere, Lagos', 'Musa Ibrahim', '+2348030003003'),
    ('MCC-P-0004', 'Emeka', 'Nwosu', '1979-11-30', 'Male', '+2348020002004', 'emeka.nwosu@example.test', 'Lekki, Lagos', 'Ngozi Nwosu', '+2348030003004'),
    ('MCC-P-0005', 'Grace', 'Adeyemi', '2001-04-12', 'Female', '+2348020002005', 'grace.adeyemi@example.test', 'Maryland, Lagos', 'Funmi Adeyemi', '+2348030003005');

INSERT INTO appointments (
    patient_id, doctor_id, appointment_date, appointment_time, reason_for_visit, appointment_status
) VALUES
    ((SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0001'), (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1001'), '2026-11-17', '09:00', 'Routine health check', 'Scheduled'),
    ((SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0002'), (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1001'), '2026-11-05', '10:30', 'Persistent headache and fever', 'Completed'),
    ((SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0003'), (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1002'), '2026-11-08', '11:00', 'Child wellness consultation', 'Completed'),
    ((SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0004'), (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1003'), '2026-11-10', '14:00', 'Blood pressure review', 'Cancelled'),
    ((SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0005'), (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1001'), '2026-11-18', '13:30', 'Stomach discomfort', 'Scheduled'),
    ((SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0001'), (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1003'), '2026-11-19', '15:00', 'Follow-up consultation', 'Scheduled');

INSERT INTO medical_records (appointment_id, diagnosis, clinical_notes) VALUES
    (
        (SELECT appointment_id FROM appointments
         WHERE patient_id = (SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0002')
           AND appointment_date = '2026-11-05'),
        'Suspected malaria',
        'Patient reported headache and fever for two days. Malaria test requested.'
    ),
    (
        (SELECT appointment_id FROM appointments
         WHERE patient_id = (SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0003')
           AND appointment_date = '2026-11-08'),
        'Routine pediatric wellness review',
        'Growth measurements reviewed. No urgent clinical concern identified.'
    );

INSERT INTO medications (medication_name, strength, dosage_form) VALUES
    ('Paracetamol', '500 mg', 'Tablet'),
    ('Artemether-Lumefantrine', '20 mg / 120 mg', 'Tablet'),
    ('Multivitamin Syrup', '5 ml', 'Syrup');

INSERT INTO prescriptions (record_id, medication_id, dose_instruction, frequency, duration_days, additional_instruction) VALUES
    (
        (SELECT mr.record_id FROM medical_records mr
         JOIN appointments a ON a.appointment_id = mr.appointment_id
         JOIN patients p ON p.patient_id = a.patient_id
         WHERE p.patient_number = 'MCC-P-0002'),
        (SELECT medication_id FROM medications WHERE medication_name = 'Paracetamol'),
        'Take one tablet', 'Every 8 hours when needed', 3, 'Take after food.'
    ),
    (
        (SELECT mr.record_id FROM medical_records mr
         JOIN appointments a ON a.appointment_id = mr.appointment_id
         JOIN patients p ON p.patient_id = a.patient_id
         WHERE p.patient_number = 'MCC-P-0002'),
        (SELECT medication_id FROM medications WHERE medication_name = 'Artemether-Lumefantrine'),
        'Take four tablets', 'Twice daily', 3, 'Complete the full course if prescribed after test review.'
    ),
    (
        (SELECT mr.record_id FROM medical_records mr
         JOIN appointments a ON a.appointment_id = mr.appointment_id
         JOIN patients p ON p.patient_id = a.patient_id
         WHERE p.patient_number = 'MCC-P-0003'),
        (SELECT medication_id FROM medications WHERE medication_name = 'Multivitamin Syrup'),
        'Take 5 ml', 'Once daily', 14, 'Use the measuring cup provided.'
    );

INSERT INTO lab_test_types (test_name, description, standard_turnaround_hours) VALUES
    ('Malaria Parasite Test', 'Microscopy test for malaria parasites.', 4),
    ('Full Blood Count', 'Measurement of major blood-cell components.', 8),
    ('Blood Glucose', 'Blood sugar level measurement.', 2);

INSERT INTO lab_test_requests (record_id, test_type_id, result_status, result_summary, completed_at) VALUES
    (
        (SELECT mr.record_id FROM medical_records mr
         JOIN appointments a ON a.appointment_id = mr.appointment_id
         JOIN patients p ON p.patient_id = a.patient_id
         WHERE p.patient_number = 'MCC-P-0002'),
        (SELECT test_type_id FROM lab_test_types WHERE test_name = 'Malaria Parasite Test'),
        'Completed', 'Malaria parasites detected.', '2026-11-05 13:00:00+01'
    ),
    (
        (SELECT mr.record_id FROM medical_records mr
         JOIN appointments a ON a.appointment_id = mr.appointment_id
         JOIN patients p ON p.patient_id = a.patient_id
         WHERE p.patient_number = 'MCC-P-0003'),
        (SELECT test_type_id FROM lab_test_types WHERE test_name = 'Full Blood Count'),
        'Requested', NULL, NULL
    );

COMMIT;
