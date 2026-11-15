-- Adds fictional appointments only for index-performance testing.
-- It does not replace the six realistic sample appointments.

INSERT INTO appointments (
    patient_id,
    doctor_id,
    appointment_date,
    appointment_time,
    reason_for_visit,
    appointment_status
)
SELECT
    ((g - 1) % 5) + 1 AS patient_id,
    (((g - 1) % 1800) / 600) + 1 AS doctor_id,
    DATE '2025-01-01' + ((g - 1) / 1800) AS appointment_date,
    TIME '08:00' + (((g - 1) % 600) * INTERVAL '1 minute') AS appointment_time,
    'Benchmark data: fictitious appointment' AS reason_for_visit,
    CASE
        WHEN g % 4 = 0 THEN 'Scheduled'
        WHEN g % 4 = 1 THEN 'Completed'
        WHEN g % 4 = 2 THEN 'Cancelled'
        ELSE 'No-show'
    END AS appointment_status
FROM generate_series(1, 50000) AS g;

ANALYZE appointments;