## Lab Instructions

### Download tools:
  - Baixe o *Docker* - https://docs.docker.com/get-started/get-docker/
  - Baixe uma interface para se conectar ao banco:
    - **Option 1**: *BeeKeeper* - https://www.pgadmin.org/
    - **Option 2**: *pgAdmin4* - https://www.pgadmin.org/

### Configure PostgreSQL

  - Utilizar *Docker* é preferível, sobretudo para para iniciantes, graças à simplicidade
    - Instale e configure o *Docker*
    - Baixe a imagem do *PostgreSQL*:
      ```
      docker pull postgres
      docker images
      ```
    - Execute o container:
      ```
      docker run -p 5432:5432 -v <projeto>/lab/pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=1234 postgres
      ```
      Opcionalmente, adicione a flag `-d` para executar o processo no background.

    - Conecte-se ao banco de dados:
      ```
      PGPASSWORD=1234 psql -h localhost -p 5432 -U postgres -d postgres
      ```

  - **Opcionalmente**, conecte-se via UI:
    - When connected on CLI, create role to allow UI to connect with the DB:
      ```
      CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD '1234';
      ```
    - Now go to the UI application an user and set up a connection:
      - host: `localhost`
      - port: `5432`
      - user: `postgres`
      - pass: `1234`

### Populate database

The book provides the DDL and sample data for the tables in the university that is used in the text, with one change: instead of using the time data type, which is not supported on some databases such as *Oracle*, we split `start_time` into `start_hr` and `start_min`, and `end_time` into `end_hr` and `end_min`, which are integer types. If the database you use supports the time type, and you wish to use it, you can modify the DDL and the sample data files accordingly.

#### DDL

Use the file `DDL.sql` for the first time. You can copy-paste the content of the file onto the query interface of your choice (CLI/UI) and run it. Alternatively, execute all commands within the file with:

```
PGPASSWORD=1234 psql -h localhost -p 5432 -U postgres -d postgres -f lab/DDL.sql
```

Use the file `DDL+drop.sql` if you wish to recreate the database after dropping existing tables

#### SQL code for creating small relations

The file `smallRelationsInsertFile.sql` contains data that matches *Appendix A* exactly. The file contains SQL insert statements to load data into all the tables, after first deleting any data that the tables currently contain.
```
PGPASSWORD=1234 psql -h localhost -p 5432 -U postgres -d postgres -f lab/smallRelationsInsertFile.sql
```

The data include students taking courses outside their department, and instructors teaching courses outside their department; this helps detect errors in natural join specifications that accidentally equate department names of students or instructors with department names of courses.

To verify data has been successfully created, run this query (after running `ANALYZE;`):
```
SELECT c.relname, c.reltuples
FROM pg_class c
JOIN pg_namespace n
ON n.oid = c.relnamespace
WHERE c.relkind   = 'r'
AND n.nspname = 'public';
```
The result should look like this:
```
  relname   | reltuples
------------+-----------
department |         7
course     |        13
instructor |        12
section    |        15
classroom  |         5
teaches    |        15
student    |        13
takes      |        22
advisor    |         9
time_slot  |        20
prereq     |         7
(11 rows)
```

#### SQL code for creating large relations
The file `largeRelationsInsertFile.sql` contains SQL insert statements for larger, randomly created relations for a truly strange university (since course titles and department names are chosen randomly).

The sizes of the relations are as follows:
  ```
  relname   | reltuples
  ------------+-----------
  department |        20
  course     |       200
  instructor |        50
  section    |       100
  classroom  |         5
  teaches    |       100
  student    |      2000
  takes      |     30000
  advisor    |      2000
  time_slot  |        20
  prereq     |       100
  (11 rows)
  ```

### FAQ

- The port 5432 is already in use

  - Problem:
    ```
    docker: Error response from daemon: driver failed programming external connectivity on endpoint infallible_mcnulty (3b89b35a4dab756ba7f224f8d5992e1d636e5babf2b538dbadde95d33093bcb9): failed to bind port 0.0.0.0:5432/tcp: Error starting userland proxy: listen tcp4 0.0.0.0:5432: bind: address already in use.
    ```

  - Solution:
    - Check if a local postgres service is already binding to that port. If that is the case, stop the service, if possible.
      ```
      sudo ss -tulpn | grep 5432
      sudo systemctl status postgresql
      sudo systemctl stop postgresql
      ```
    - Alternatively, use a different port number to serve the postgres service running on docker.