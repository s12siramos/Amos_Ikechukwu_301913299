# Query Performance Analysis

## Query tested

The tested query retrieves scheduled appointments for a specific appointment date:

```sql
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
```

## Optimisation applied

The following composite index was created:

```sql
CREATE INDEX idx_appointments_status_date
ON appointments (appointment_status, appointment_date);
```

The index was selected because the query filters by both `appointment_status` and `appointment_date`.

## Execution-plan comparison

Before the index, PostgreSQL used a sequential scan. It inspected the appointments table and removed 49,556 non-matching rows before returning 450 matching appointments. The plan accessed 807 shared data blocks.

After the index was created, PostgreSQL used a Bitmap Index Scan on `idx_appointments_status_date`, followed by a Bitmap Heap Scan. This reduced the table data accessed to approximately 33 blocks while still returning the same 450 appointments.

## Timing result

The single measured execution time was 9.503 ms before indexing and 10.030 ms after indexing. The very small difference of 0.527 ms does not demonstrate a reliable timing improvement in one run. This can be influenced by cache state and normal measurement variation.

However, the execution plan confirms that the index reduces the amount of data PostgreSQL must search. This optimisation is expected to become more valuable as the clinic appointment table grows larger and queries become more frequent.