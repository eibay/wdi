CREATE TABLE shirts (
id serial primary key,
name varchar(255),
img_src varchar(255),
quantity integer,
price integer
);

CREATE TABLE  orders (
id serial primary key,
email  varchar(255),
quantity integer,
closed boolean,
shirt integer
);