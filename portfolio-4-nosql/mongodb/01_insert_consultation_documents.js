// MIVA Care Clinic NoSQL consultation documents.
// All data is fictional and used for academic demonstration only.

const clinicDb = db.getSiblingDB("miva_care_nosql");

clinicDb.consultations.createIndex({ consultationId: 1 }, { unique: true });

clinicDb.consultations.updateOne(
  { consultationId: "MCC-C-001" },
  {
    $set: {
      consultationId: "MCC-C-001",
      patient: {
        patientNumber: "MCC-P-0002",
        fullName: "Tunde Bello",
        dateOfBirth: "1988-02-21",
        phoneNumber: "+2348020002002"
      },
      doctor: {
        licenceNumber: "MCC-DR-1001",
        fullName: "Adaeze Okafor",
        speciality: "Family Medicine"
      },
      appointment: {
        date: "2026-11-05",
        time: "10:30",
        status: "Completed"
      },
      diagnosis: "Suspected malaria",
      clinicalNotes: "Patient reported headache and fever for two days.",
      prescriptions: [
        {
          medicationName: "Paracetamol",
          strength: "500 mg",
          doseInstruction: "Take one tablet",
          frequency: "Every 8 hours when needed",
          durationDays: 3
        },
        {
          medicationName: "Artemether-Lumefantrine",
          strength: "20 mg / 120 mg",
          doseInstruction: "Take four tablets",
          frequency: "Twice daily",
          durationDays: 3
        }
      ],
      laboratoryTests: [
        {
          testName: "Malaria Parasite Test",
          status: "Completed",
          result: "Malaria parasites detected."
        }
      ],
      recordedAt: new Date("2026-11-05T12:00:00Z")
    }
  },
  { upsert: true }
);

clinicDb.consultations.updateOne(
  { consultationId: "MCC-C-002" },
  {
    $set: {
      consultationId: "MCC-C-002",
      patient: {
        patientNumber: "MCC-P-0003",
        fullName: "Zainab Ibrahim",
        dateOfBirth: "2016-09-03",
        phoneNumber: "+2348020002003"
      },
      doctor: {
        licenceNumber: "MCC-DR-1002",
        fullName: "Chinedu Okoro",
        speciality: "Pediatrics"
      },
      appointment: {
        date: "2026-11-08",
        time: "11:00",
        status: "Completed"
      },
      diagnosis: "Routine pediatric wellness review",
      clinicalNotes: "Growth measurements reviewed. No urgent clinical concern identified.",
      prescriptions: [
        {
          medicationName: "Multivitamin Syrup",
          strength: "5 ml",
          doseInstruction: "Take 5 ml",
          frequency: "Once daily",
          durationDays: 14
        }
      ],
      laboratoryTests: [
        {
          testName: "Full Blood Count",
          status: "Requested",
          result: null
        }
      ],
      recordedAt: new Date("2026-11-08T12:30:00Z")
    }
  },
  { upsert: true }
);

print("Consultation documents saved:");
printjson(
  clinicDb.consultations.find(
    {},
    { _id: 0, consultationId: 1, "patient.fullName": 1, diagnosis: 1 }
  ).toArray()
);