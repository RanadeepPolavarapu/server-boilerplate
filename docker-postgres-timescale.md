### Running PostgreSQL with TimescaleDB on Docker

```bash
docker run -v /root/pg_data_vol:/var/lib/postgresql/data --restart always -d --name timescaledb -p 5432:5432 -e POSTGRES_PASSWORD=<PG_PWD> timescale/timescaledb:1.0.0-rc1-pg10
```


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
-- >>> OUTPUT
-- postgres=# \l
--                                      List of databases
--    Name    |    Owner    | Encoding |  Collate   |   Ctype    |      Access privileges      
-- -----------+-------------+----------+------------+------------+-----------------------------
--  finance   | rpolavarapu | UTF8     | en_US.utf8 | en_US.utf8 | =Tc/rpolavarapu            +
--            |             |          |            |            | rpolavarapu=CTc/rpolavarapu+
--            |             |          |            |            | partner=c/rpolavarapu
--  postgres  | postgres    | UTF8     | en_US.utf8 | en_US.utf8 | 
--  template0 | postgres    | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                +
--            |             |          |            |            | postgres=CTc/postgres
--  template1 | postgres    | UTF8     | en_US.utf8 | en_US.utf8 | postgres=CTc/postgres      +
--            |             |          |            |            | =c/postgres
-- (4 rows)

# and/or every other database using timescale
\c finance
ALTER EXTENSION timescaledb UPDATE; 
```
