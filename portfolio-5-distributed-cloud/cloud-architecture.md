\# Cloud Architecture and Distributed Database Discussion



\## Deployed environment



The MIVA Care Clinic consultation model is deployed in MongoDB Atlas.



| Item | Value |

|---|---|

| Cloud provider | AWS |

| Region | Paris (`eu-west-3`) |

| Deployment | MongoDB Atlas Free cluster |

| MongoDB version | 8.0.37 |

| Topology | Replica Set — 3 nodes |

| Database | `miva\_care\_cloud` |

| Collection | `consultations` |



\## Replication and availability



The Atlas cluster is configured as a three-node replica set. The nodes maintain replicated copies of the database. If the primary node becomes unavailable, an eligible secondary node can be elected as the new primary. This provides higher availability than a single database server.



\## Consistency



Clinical records must be saved reliably. The application should wait for acknowledgement of a database write before confirming that an appointment or consultation has been recorded. This reduces the risk of staff seeing incomplete or missing clinical information.



\## Sharding



Sharding was not configured because this academic clinic proof of concept has a small data volume. If the system grows to millions of records, sharding could divide data across multiple servers. A shard key would need careful testing to prevent uneven distribution and slow queries.



\## Security and recovery



Access is controlled through Atlas database-user credentials and IP access-list rules. Connections use TLS encryption. The current Free deployment shows backups as inactive; a production system should enable backups and test recovery regularly.



\## Evidence



The `evidence/` folder contains screenshots of the cloud database, inserted consultation records, patient index, and three-node replica-set deployment.

