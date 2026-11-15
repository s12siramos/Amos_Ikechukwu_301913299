# Create a separate database used only to verify the backup restore.
docker exec miva-care-postgres createdb `
  -U clinic_admin `
  miva_care_restore_verification

# Restore the custom-format backup into the separate verification database.
cmd /c "docker exec -i miva-care-postgres pg_restore -e -U clinic_admin -d miva_care_restore_verification --no-owner --no-privileges < portfolio-5-backup-recovery\miva_care_clinic_backup.dump"

# Confirm that the restored database contains the expected clinic tables and data.
docker exec miva-care-postgres psql `
  -U clinic_admin `
  -d miva_care_restore_verification `
  -c "SELECT (SELECT COUNT(*) FROM patients) AS patients, (SELECT COUNT(*) FROM doctors) AS doctors, (SELECT COUNT(*) FROM appointments) AS appointments;"