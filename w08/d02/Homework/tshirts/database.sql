CREATE TABLE shirts(id serial4 PRIMARY KEY, style varchar(255), price decimal, quantity integer, image_url varchar(255));

CREATE TABLE orders(id serial4 PRIMARY KEY, order_fullfilled boolean);

CREATE TABLE customers(id serial4 PRIMARY KEY, name varchar(255), email varchar(255));