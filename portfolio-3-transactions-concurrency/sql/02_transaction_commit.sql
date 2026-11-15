-- Portfolio 3: Transaction commit demonstration.
-- The inserted appointment remains after COMMIT.

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
    (SELECT patient_id FROM patients WHERE patient_number = 'MCC-P-0005'),
    (SELECT doctor_id FROM doctors WHERE licence_number = 'MCC-DR-1003'),
    DATE '2026-12-02',
    TIME '16:00',
    'Transaction commit demonstration',
    'Scheduled'
);

COMMIT;

\echo 'Appointment count after commit:'
SELECT COUNT(*) AS committed_appointment_count
FROM appointments
WHERE reason_for_visit = 'Transaction commit demonstration';