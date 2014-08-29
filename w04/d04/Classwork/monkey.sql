
CREATE DATABASE jungle;

\c; # connect to database

\d; # show the structure

CREATE TABLE monkeys (name varchar(50), age integer);

INSERT INTO monkeys (name, age) VALUES ('Brutus', 13);
INSERT INTO monkeys (name, age) VALUES ('Cletus', 13);

SELECT * FROM monkeys; # show all entries on monkeys



CREATE TABLE birds (species varchar, wingspan integer, carnivore boolean);
CREATE TABLE trees (height integer, continent varchar);

SELECT * FROM birds WHERE carnivore = true; # show all carnivore birds 

CREATE TABLE meerkats (id serial primary key, name varchar(50), age integer);

\q

