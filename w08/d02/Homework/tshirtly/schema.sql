CREATE DATABASE tshirtly;

CREATE TABLE shirts (
id serial primary key,
name text,
price integer,
quantity integer,
image text);

CREATE TABLE orders (
id serial primary key,
name text,
price integer,
image text,
shirt_id integer);