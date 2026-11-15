\# Portfolio 5: Database Backup and Recovery



This portfolio demonstrates a PostgreSQL backup and restore verification process for the MIVA Care Clinic Management System.



\## Backup approach



A custom-format PostgreSQL backup was created using `pg\_dump`:



```powershell

pg\_dump -U clinic\_admin -d miva\_care\_clinic --format=custom

```



The backup is stored as:



```text

miva\_care\_clinic\_backup.dump

```



Custom format was selected because it is compressed and can be restored selectively with `pg\_restore`.



\## Restore verification



The backup was restored into a separate database named:



```text

miva\_care\_restore\_verification

```



The live database, `miva\_care\_clinic`, was not modified during verification.



\## Verification result



After restoration, PostgreSQL confirmed the following records:



| Table | Restored records |

|---|---:|

| `patients` | 5 |

| `doctors` | 3 |

| `appointments` | 50,007 |



This proves that the backup archive can restore the database structure and clinic data successfully.



\## Scripts



\- `scripts/01\_create\_backup.ps1` — creates the PostgreSQL custom-format backup.

\- `scripts/02\_restore\_verification.ps1` — restores the backup into a separate verification database and checks record counts.

\- `evidence/` — screenshots proving the backup and restore results.



\## Important note



All clinic data used in this academic portfolio is fictional. In a production environment, backup files must be encrypted, access-controlled, retained according to policy, and tested regularly.

