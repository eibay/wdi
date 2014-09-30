CREATE DATABASE groceries;

\c groceries;

CREATE TABLE items(
  name varchar(255),
  id serial primary key
);