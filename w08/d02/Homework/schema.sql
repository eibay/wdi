CREATE DATABASE tshirtly;

\c tshirtly;

CREATE TABLE shirts (
id serial primary key,
name text,
quantity integer,
price integer,
img_url text
);