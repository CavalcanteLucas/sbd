
- Download tools:
  - Download **PosgreSQL** - https://www.postgresql.org/download/
  - (Optional) Download **Docker** - https://docs.docker.com/get-started/get-docker/
  - Download an user interface:
    - **Option 1**: **pgAdmin4** - https://www.pgadmin.org/
    - **Option 2**: **BeeKeeper** - https://www.pgadmin.org/

- Configure PostgreSQL
  - **Option 1**: Locally (Suggested for more advanced users)
      - Install PostgreSQL.
      - Find out the directory where the PostgreSQL binaries were installed (e.g `/usr/lib/postgresql/16/bin`)
      - Create a database (called `dbbook` in this example) using the command line by executing
        ```
        /usr/lib/postgresql/16/bin/initdb -D dbbook 
        ```
        This creates a directory `dbbook`.
      - Edit `dbbook/postgresql.conf` and replace the line
        ```
        #port = 5432
        ```
        by
        ```
        port = 11433
        ```
        Any unused port number can be used, `11433` is just an example.
      - Start the server:
        ```
        /usr/lib/postgresql/16/bin/pg_ctl -D dbbook -o "-k /tmp" start
        ```
        If you run this command from any other directory, replace `dbbook` by the full path of the PostgreSQL directory you created.
      - You can stop or restart the servers with:
        ```
        /usr/lib/postgresql/16/bin/pg_ctl -D dbbook stop
        /usr/lib/postgresql/16/bin/pg_ctl -D dbbook restart
        ```

  - **Option 2**: Using Docker (Preferred for beginners due to simplicity)
    - Install and configure Docker
    - Fetch PostgreSQL image and verify it has been downloaded successfully:
      ```
      docker pull postgres
      docker images
      ```
    - Execute container:
      ```
      docker run -p 5432:5432 -v /home/lucas/codes/misc/sbd/lab/pgdata:/var/lib/postgresql/data -e POSTGRES_PASSWORD=1234 postgres
      ```
      Optionally, add flag `-d` for running it in the background.

- Connect to PostgreSQL
  - **Option 1**: via CLI
    ```
    psql -h /tmp -p 11433 -d postgres
    ```

- Populate database
  - The book provides the DDL and sample data for the tables in the university that is used in the text, with one change: instead of using the time data type, which is not supported on some databases such as *Oracle*, we split `start_time` into `start_hr` and `start_min`, and `end_time` into `end_hr` and `end_min`, which are integer types. If the database you use supports the time type, and you wish to use it, you can modify the DDL and the sample data files accordingly.

  - **DDL**
    - Use the file `DDL.sql` for the first time
    - Use the file `DDL+drop.sql` if you wish to recreate the database after dropping existing tables
  - **SQL code for creating small relations**
    - The file `smallRelationsInsertFile.sql` contains data that matches *Appendix A* exactly. The file contains SQL insert statements to load data into all the tables, after first deleting any data that the tables currently contain.
    - The data include students taking courses outside their department, and instructors teaching courses outside their department; this helps detect errors in natural join specifications that accidentally equate department names of students or instructors with department names of courses.
  - **SQL code for creating large relations**
    - The file `largeRelationsInsertFile.sql` contains SQL insert statements for larger, randomly created relations for a truly strange university (since course titles and department names are chosen randomly).
    - The sizes of the relations are as follows:
      ```
      department	20
      instructor	50
      student	2000
      course	200
      prereq	100
      section	100
      time_slot	20
      teaches	100
      takes	30000
      advisor	2000
      ```
