CREATE TABLE customers (
id serial primary key,
email varchar(255)
);

CREATE TABLE shirts (
id serial primary key,
quantity integer,
price money,
image text
);

CREATE TABLE purchases (
id serial primary key,
customer_id integer references customers(id),
shirt_id integer references shirts(id),
quantity integer,
cost money,
filled boolean
);