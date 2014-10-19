CREATE DATABASE dogs;

\c dogs;

CREATE TABLE puppies (
id serial primary key,
name varchar (169),
breed varchar(100),
cuteness integer
);