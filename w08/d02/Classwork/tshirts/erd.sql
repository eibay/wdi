

CREATE TABLE carts(
	id serial primary key,
  quantity integer,
  shirt_id integer
);

CREATE TABLE shirts(
  picture text,
  id serial primary key,
  quantity integer,
  price integer,
  name text
);
CREATE TABLE users(
  name text,
  email text,
  id serial primary key
);

CREATE TABLE orders(
  id serial primary key,
  fulfilled boolean
);
CREATE TABLE ordercontents(
  id serial primary key,
  shirt_id integer,
  quantity integer,
  order_id integer
);

CREATE TABLE carts(
  id serial primary key,
  quantity integer,
  shirt_id integer
);