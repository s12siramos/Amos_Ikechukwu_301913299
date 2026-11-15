-- Query-performance plan after creating idx_appointments_status_date.

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date,
    appointment_time,
    appointment_status
FROM appointments
WHERE appointment_status = 'Scheduled'
  AND appointment_date = DATE '2025-01-15';