CREATE DATABASE people;

CREATE TABLE people(
id serial primary key,
name varchar(50),
age integer
);

INSERT INTO people (name, age) VALUES ('Jeff', 25);