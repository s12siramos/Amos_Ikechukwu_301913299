# Create a compressed PostgreSQL backup inside the Docker container.
docker exec miva-care-postgres pg_dump `
  -U clinic_admin `
  -d miva_care_clinic `
  --format=custom `
  --file=/tmp/miva_care_clinic_backup.dump

# Copy the completed backup from Docker to this portfolio folder.
docker cp `
  miva-care-postgres:/tmp/miva_care_clinic_backup.dump `
  portfolio-5-backup-recovery/miva_care_clinic_backup.dump