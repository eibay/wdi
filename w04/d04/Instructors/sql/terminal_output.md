```bash
DarthNeel ~/code/wdi/rosencrantz/w04/d04/Instructors/sql
$ psql
psql (9.3.4)
Type "help" for help.

DarthNeel=# CREATE DATABASE jungle;
CREATE DATABASE
DarthNeel=# \c jungle
You are now connected to database "jungle" as user "DarthNeel".
jungle=# CREATE TABLE monkeys (name varchar(50), age integer);
CREATE TABLE
jungle=# \d
          List of relations
 Schema |  Name   | Type  |   Owner
--------+---------+-------+-----------
 public | monkeys | table | DarthNeel
(1 row)

jungle=# \help
Available help:
  ABORT                            DEALLOCATE
  ALTER AGGREGATE                  DECLARE
  ALTER COLLATION                  DELETE
  ALTER CONVERSION                 DISCARD
  ALTER DATABASE                   DO
  ALTER DEFAULT PRIVILEGES         DROP AGGREGATE
  ALTER DOMAIN                     DROP CAST
  ALTER EVENT TRIGGER              DROP COLLATION
  ALTER EXTENSION                  DROP CONVERSION
  ALTER FOREIGN DATA WRAPPER       DROP DATABASE
  ALTER FOREIGN TABLE              DROP DOMAIN
jungle=# help
You are using psql, the command-line interface to PostgreSQL.
Type:  \copyright for distribution terms
       \h for help with SQL commands
       \? for help with psql commands
       \g or terminate with semicolon to execute query
       \q to quit
jungle=# INSERT INTO monkeys (name, age) VALUES ('Brutus', 13)
jungle-# ^C
jungle=# INSERT INTO monkeys (name, age) VALUES ('Brutus', 13);
INSERT 0 1
jungle=# INSERT INTO monkeys (name, age) VALUES ('CLetus', "13");
ERROR:  column "13" does not exist
LINE 1: INSERT INTO monkeys (name, age) VALUES ('CLetus', "13");
                                                          ^
jungle=#
jungle=# INSERT INTO monkeys (name, age) VALUES ('Cletus', 4);
INSERT 0 1
jungle=# SELECT * FROM monkeys;
  name  | age
--------+-----
 Brutus |  13
 Cletus |   4
(2 rows)

jungle=# \q
DarthNeel ~/code/wdi/rosencrantz/w04/d04/Instructors/sql
$ psql
psql (9.3.4)
Type "help" for help.

DarthNeel=# CREATE TABLE birds (species varchar(200), wingspan integer, carnivore boolean)
DarthNeel-# ;
CREATE TABLE
DarthNeel=# CREATE TABLE trees (height integer, continent varchar(50))
DarthNeel-# ;
CREATE TABLE
DarthNeel=# INSERT INTO birds (species, wingspan, carnivore) VALUES ('Lola', 42, true)
DarthNeel-# ;
INSERT 0 1
DarthNeel=# INSERT INTO birds (species, wingspan, carnivore) VALUES ('Duke', 12, false)
;
INSERT 0 1
DarthNeel=# SELECT * FROM birds;
 species | wingspan | carnivore
---------+----------+-----------
 Lola    |       42 | t
 Duke    |       12 | f
(2 rows)

DarthNeel=# SELECT * FROM birds WHERE carnivore = true;
 species | wingspan | carnivore
---------+----------+-----------
 Lola    |       42 | t
(1 row)

DarthNeel=# SELECT * FROM birds WHERE name = 'Lola';
ERROR:  column "name" does not exist
LINE 1: SELECT * FROM birds WHERE name = 'Lola';
                                  ^
DarthNeel=# SELECT * FROM birds WHERE species = 'Lola';
 species | wingspan | carnivore
---------+----------+-----------
 Lola    |       42 | t
(1 row)

DarthNeel=# CREATE TABLE meerkats (id serial primary key,  name varchar(50), age integer)
DarthNeel-# ;
CREATE TABLE
DarthNeel=# INSERT INTO meerkats (name, age) VALUES ('Bob', 68);
INSERT 0 1
DarthNeel=# SELECT * FROM meerkats;
 id | name | age
----+------+-----
  1 | Bob  |  68
(1 row)

DarthNeel=# CREATE DATABASE garage
DarthNeel-# ;
ERROR:  database "garage" already exists
DarthNeel=# CREATE DATABASE autobody;
CREATE DATABASE
DarthNeel=# \c autobody
You are now connected to database "autobody" as user "DarthNeel".
autobody=# CREATE TABLE cars (id serial primary key, make varchar(50), model varcahr(50));
ERROR:  type "varcahr" does not exist
LINE 1: ...s (id serial primary key, make varchar(50), model varcahr(50...
                                                             ^
autobody=# CREATE TABLE cars (id serial primary key, make varchar(50), model varchar(50));
CREATE TABLE
autobody=# DROP TABLE cars;
DROP TABLE
autobody=# CREATE TABLE cars (id serial primary key, make varchar(50), model varchar(50), mechanic_id integer);
CREATE TABLE
autobody=# CREATE TABLE mechanic (id serial primary key, name varchar(50));
CREATE TABLE
autobody=# INSERT INTO mechanic (name) VALUES ('Fred');
INSERT 0 1
autobody=# INSERT INTO cars (make, model, mechanic_id) VALUES ('Ford', 'Mustang', 1);
INSERT 0 1
autobody=# SELECT * FROM cars WHERE mechanic_id = 1;
 id | make |  model  | mechanic_id
----+------+---------+-------------
  1 | Ford | Mustang |           1
(1 row)

autobody=#
```
