CREATE DATABASE tshirtly_inventory;

CREATE TABLE tshirts (
id serial primary key,
name varchar(255),
quantity integer,
price integer,
image_url text
);
INSERT INTO tshirts (name, quantity, price, image_url) VALUES ('Bike Tshirt', 10, 25, 'http://www.zsellbd.com/wp-content/uploads/2014/08/Plain-Lazy_Kids-Happy-Bike-T-Shirt-blue_20131.jpg');

CREATE TABLE orders (
id serial primary key,
tshirt_id integer,
quantity integer,
email_address text
);

INSERT INTO orders (tshirt_id, quantity, email_address) VALUES ('1', 1, 'brenda.dargan@gmail.com');