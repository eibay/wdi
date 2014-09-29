CREATE database store;

\c store

CREATE TABLE customers (
  id serial primary key,
  name varchar(250),
  email text
);

CREATE TABLE tshirts (
  id serial primary key,
  size varchar(250),
  price varchar(250),
  qty integer,
  image_url text,
  cust_id integer
);

