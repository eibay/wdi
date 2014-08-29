-- To create database
CREATE DATABASE jungle;

-- To connect to database
\c;

-- To create a table in my database
CREATE TABLE monkeys (name varchar(50), age integer);

-- Add column to an existing table
ALTER TABLE monkeys ADD weight integer;

-- To add an entry
INSERT INTO monkeys (name, age) VALUES ('Brutus', 13);
INSERT INTO monkeys (name, age) VALUES ('Cletus', 13);

-- Return all entries on table
SELECT * FROM monkeys;

-- To update an entry
UPDATE monkeys SET age=50 WHERE name='Brutus';

-- To delete an entry
DELETE FROM monkeys WHERE name='Cletus';



CREATE TABLE birds (species varchar(50), wingspan integer, carnivore boolean);
CREATE TABLE trees (height integer, continent varchar(30));

INSERT INTO birds (species, wingspan, carnivore) VALUES ('Tucan', 32, false);
INSERT INTO birds (species, wingspan, carnivore) VALUES ('Falcon', 70, true);

-- Return specific values
SELECT FROM * birds WHERE species = 'Falcon'

-- Assign an idea
id serial primary key



#Terminal outputs 

joebiggica=# CREATE DATABASE autobody;
CREATE DATABASE
joebiggica=# \c autobody
You are now connected to database "autobody" as user "joebiggica".
autobody=# CREATE TABLE cars (id serial primary key, make varchar(50), model varchar(50), mech_id integer);
CREATE TABLE
autobody=# CREATE TABLE mech (id serial primary key, name varchar(50));
CREATE TABLE
autobody=# INSERT INTO mech (name) VALUES ('Fred');
INSERT 0 1
autobody=# INSERT INTO cars (make, model, mech_id) VALUES ('Ford', 'Mustang', 1);
INSERT 0 1
autobody=# SELECT * FROM cars WHERE mech_id = 1;
 id | make |  model  | mech_id 
----+------+---------+---------
  1 | Ford | Mustang |       1
(1 row)