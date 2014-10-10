CREATE DATABASE library;

CREATE TABLE members(
  id serial primary key,
  name varchar(255),
);

CREATE TABLE books(
  id serial primary key,
  title varchar(255),
  member_id integer,
  borrowed_on date
);
