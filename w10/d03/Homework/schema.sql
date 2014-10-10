CREATE DATABASE library;

CREATE TABLE books(
id serial primary key,
name text
);

CREATE TABLE children(
id serial primary key,
name text
);

CREATE TABLE borrowedbooks(
id serial primary key,
child_id integer,
book_id integer
);
