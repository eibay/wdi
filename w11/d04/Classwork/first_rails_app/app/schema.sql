CREATE DATABASE dog;

\c dogs

CREATE TABLE dogs (
  id serial primary key,
  name varchar(250),
  breed varchar(250),
  cuteness integer
);