// Create an index for fast consultation lookup by patient number.

const clinicDb = db.getSiblingDB("miva_care_nosql");

clinicDb.consultations.createIndex(
  { "patient.patientNumber": 1 },
  { name: "idx_patient_number" }
);

printjson(clinicDb.consultations.getIndexes());