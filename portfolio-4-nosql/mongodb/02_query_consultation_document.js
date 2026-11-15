// Retrieve Tunde Bello's complete consultation document.

const clinicDb = db.getSiblingDB("miva_care_nosql");

printjson(
  clinicDb.consultations.findOne(
    { "patient.patientNumber": "MCC-P-0002" },
    { _id: 0 }
  )
);