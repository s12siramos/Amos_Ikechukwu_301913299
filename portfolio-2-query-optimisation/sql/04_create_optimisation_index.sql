-- Index created to speed up appointment searches by status and date.

CREATE INDEX IF NOT EXISTS idx_appointments_status_date
ON appointments (appointment_status, appointment_date);

ANALYZE appointments;