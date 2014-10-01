CREATE DATABASE grocery;

\c grocery;

CREATE TABLE items(
id serial primary key,
name text
);