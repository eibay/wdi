CREATE DATABASE dogs;

CREATE TABLE breeds (
  id serial primary key,
  species varchar(100),
  age integer
);