CREATE DATABASE library;

\c library

CREATE TABLE books (
  id serial primary key,
  title varchar(250)
);

CREATE TABLE children (
  id serial primary key,
  name varchar(250)
);

CREATE TABLE borrowedbooks (
  id serial primary key,
  child_id integer,
  book_id integer
);