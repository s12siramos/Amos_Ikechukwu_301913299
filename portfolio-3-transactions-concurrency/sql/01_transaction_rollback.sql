-- Portfolio 3: Transaction rollback demonstration.
-- The inserted appointment must disappear after ROLLBACK.

\pset pager off

BEGIN;

INSERT INTO appointments (
    patient_id,
    doctor_id,
    appointment_date,
    appointment_time,
    reason_for_visit,
    appointment_status
)
VALUES (
    (SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0001'),
    (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1001'),
    DATE '2026-12-01',
    TIME '16:00',
    'Transaction rollback demonstration',
    'Scheduled'
);

\echo 'Appointment exists inside the transaction:'
SELECT appointment_id, appointment_date, appointment_time, reason_for_visit
FROM appointments
WHERE reason_for_visit = 'Transaction rollback demonstration';

ROLLBACK;

\echo 'Appointment count after rollback:'
SELECT COUNT(*) AS rolled_back_appointment_count
FROM appointments
WHERE reason_for_visit = 'Transaction rollback demonstration';