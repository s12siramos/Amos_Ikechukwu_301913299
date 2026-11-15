-- MIT 8103 Advanced Database Systems
-- Portfolio 2: Query Processing and Optimisation
-- MIVA Care Clinic Management System

\pset pager off

\echo 'QUERY 1: Upcoming scheduled appointments'
SELECT
    a.appointment_date,
    a.appointment_time,
    p.patient_number,
    p.first_name || ' ' || p.last_name AS patient,
    d.first_name || ' ' || d.last_name AS doctor,
    d.speciality,
    a.reason_for_visit
FROM appointments a
JOIN patients p ON p.patient_id = a.patient_id
JOIN doctors d ON d.doctor_id = a.doctor_id
WHERE a.appointment_status = 'Scheduled'
  AND a.appointment_date >= DATE '2026-11-14'
ORDER BY a.appointment_date, a.appointment_time;

\echo 'QUERY 2: Complete medical history for Tunde Bello'
SELECT
    p.patient_number,
    p.first_name || ' ' || p.last_name AS patient,
    a.appointment_date,
    d.first_name || ' ' || d.last_name AS doctor,
    mr.diagnosis,
    mr.clinical_notes
FROM patients p
JOIN appointments a ON a.patient_id = p.patient_id
JOIN doctors d ON d.doctor_id = a.doctor_id
LEFT JOIN medical_records mr ON mr.appointment_id = a.appointment_id
WHERE p.patient_number = 'MCC-P-0002'
ORDER BY a.appointment_date DESC;

\echo 'QUERY 3: Doctor appointment workload'
SELECT
    d.doctor_id,
    d.first_name || ' ' || d.last_name AS doctor,
    d.speciality,
    COUNT(a.appointment_id) AS total_appointments,
    COUNT(*) FILTER (WHERE a.appointment_status = 'Completed') AS completed_appointments,
    COUNT(*) FILTER (WHERE a.appointment_status = 'Scheduled') AS scheduled_appointments
FROM doctors d
LEFT JOIN appointments a ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name, d.speciality
ORDER BY total_appointments DESC, doctor;

\echo 'QUERY 4: Completed laboratory test results'
SELECT
    p.patient_number,
    p.first_name || ' ' || p.last_name AS patient,
    ltt.test_name,
    ltr.result_summary,
    ltr.completed_at
FROM lab_test_requests ltr
JOIN medical_records mr ON mr.record_id = ltr.record_id
JOIN appointments a ON a.appointment_id = mr.appointment_id
JOIN patients p ON p.patient_id = a.patient_id
JOIN lab_test_types ltt ON ltt.test_type_id = ltr.test_type_id
WHERE ltr.result_status = 'Completed'
ORDER BY ltr.completed_at DESC;

\echo 'QUERY 5: Prescriptions issued to patients'
SELECT
    p.patient_number,
    p.first_name || ' ' || p.last_name AS patient,
    m.medication_name,
    m.strength,
    pr.dose_instruction,
    pr.frequency,
    pr.duration_days,
    pr.additional_instruction
FROM prescriptions pr
JOIN medications m ON m.medication_id = pr.medication_id
JOIN medical_records mr ON mr.record_id = pr.record_id
JOIN appointments a ON a.appointment_id = mr.appointment_id
JOIN patients p ON p.patient_id = a.patient_id
ORDER BY p.patient_number, m.medication_name;