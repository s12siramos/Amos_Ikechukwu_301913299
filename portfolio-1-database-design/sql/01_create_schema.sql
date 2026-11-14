-- MIT 8103 Advanced Database Systems
-- Portfolio 1: MIVA Care Clinic Management System
-- PostgreSQL schema creation script

CREATE TABLE departments (
    department_id BIGSERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    phone_extension VARCHAR(10)
);

CREATE TABLE doctors (
    doctor_id BIGSERIAL PRIMARY KEY,
    department_id BIGINT NOT NULL REFERENCES departments(department_id) ON DELETE RESTRICT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    speciality VARCHAR(100) NOT NULL,
    licence_number VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE patients (
    patient_id BIGSERIAL PRIMARY KEY,
    patient_number VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL CHECK (date_of_birth >= DATE '1900-01-01'),
    gender VARCHAR(20) NOT NULL CHECK (gender IN ('Female', 'Male', 'Other', 'Prefer not to say')),
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255),
    home_address TEXT,
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(20),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE appointments (
    appointment_id BIGSERIAL PRIMARY KEY,
    patient_id BIGINT NOT NULL REFERENCES patients(patient_id) ON DELETE RESTRICT,
    doctor_id BIGINT NOT NULL REFERENCES doctors(doctor_id) ON DELETE RESTRICT,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason_for_visit TEXT NOT NULL,
    appointment_status VARCHAR(20) NOT NULL DEFAULT 'Scheduled'
        CHECK (appointment_status IN ('Scheduled', 'Completed', 'Cancelled', 'No-show')),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_doctor_appointment_time UNIQUE (doctor_id, appointment_date, appointment_time)
);

CREATE TABLE medical_records (
    record_id BIGSERIAL PRIMARY KEY,
    appointment_id BIGINT NOT NULL UNIQUE REFERENCES appointments(appointment_id) ON DELETE RESTRICT,
    diagnosis TEXT NOT NULL,
    clinical_notes TEXT,
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE medications (
    medication_id BIGSERIAL PRIMARY KEY,
    medication_name VARCHAR(150) NOT NULL,
    strength VARCHAR(100) NOT NULL,
    dosage_form VARCHAR(50) NOT NULL,
    CONSTRAINT uq_medication UNIQUE (medication_name, strength, dosage_form)
);

CREATE TABLE prescriptions (
    prescription_id BIGSERIAL PRIMARY KEY,
    record_id BIGINT NOT NULL REFERENCES medical_records(record_id) ON DELETE RESTRICT,
    medication_id BIGINT NOT NULL REFERENCES medications(medication_id) ON DELETE RESTRICT,
    dose_instruction VARCHAR(150) NOT NULL,
    frequency VARCHAR(100) NOT NULL,
    duration_days INTEGER NOT NULL CHECK (duration_days > 0),
    additional_instruction TEXT
);

CREATE TABLE lab_test_types (
    test_type_id BIGSERIAL PRIMARY KEY,
    test_name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,
    standard_turnaround_hours INTEGER CHECK (standard_turnaround_hours > 0)
);

CREATE TABLE lab_test_requests (
    lab_request_id BIGSERIAL PRIMARY KEY,
    record_id BIGINT NOT NULL REFERENCES medical_records(record_id) ON DELETE RESTRICT,
    test_type_id BIGINT NOT NULL REFERENCES lab_test_types(test_type_id) ON DELETE RESTRICT,
    requested_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    result_status VARCHAR(20) NOT NULL DEFAULT 'Requested'
        CHECK (result_status IN ('Requested', 'In Progress', 'Completed', 'Cancelled')),
    result_summary TEXT,
    completed_at TIMESTAMPTZ,
    CONSTRAINT chk_completed_lab_result CHECK (
        (result_status = 'Completed' AND completed_at IS NOT NULL)
        OR result_status <> 'Completed'
    )
);
