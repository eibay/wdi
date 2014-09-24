CREATE DATABASE tshirtly;

\c tshirtly;

CREATE TABLE shirts (
id serial primary key,
name text,
quantity integer,
price integer,
img_url text
);

CREATE TABLE orders (
id serial primary key,
email text,
order_amount integer,
shirt_id integer
);
