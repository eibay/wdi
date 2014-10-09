CREATE DATABASE library;

\c library

CREATE TABLE kids(
id serial primary key,
name varchar(255)
);

CREATE TABLE books(
id serial primary key,
name varchar(255),
kids_id integer
);