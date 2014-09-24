CREATE TABLE customers(
  id serial primary key,
  email varchar(100)
);

CREATE TABLE orders(
  id serial primary key,
  fulfilled boolean,
  customer_id integer
);

CREATE TABLE tshirts(
  id serial primary key,
  image varchar(255),
  price decimal(5,2),
  quantity integer,
  name varchar(100),
  order_id integer
);