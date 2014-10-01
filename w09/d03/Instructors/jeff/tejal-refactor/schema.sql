CREATE DATABASE grocery;
\c grocery;
CREATE TABLE items(
  item varchar (250),
  id serial primary key,
  number integer
);
