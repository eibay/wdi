CREATE DATABASE library;
\c library;

CREATE TABLE books(
  id serial primary key,
  name varchar(255),
  availability boolean
);

CREATE TABLE children(
  id serial primary key,
  name varchar(255),
  book_id integer
);