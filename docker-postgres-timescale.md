### Upgrade TimescaleDB on Docker

Docs: https://docs.timescale.com/v1.0/using-timescaledb/update-db

```bash
docker exec -it timescaledb psql -U postgres -X
```

Execute the following in the `psql` instance:  
```sql
# within the PostgreSQL instance
ALTER EXTENSION timescaledb UPDATE;

# list all databases
\l
# and/or every other database using timescale
\c finance
ALTER EXTENSION timescaledb UPDATE; 
```
