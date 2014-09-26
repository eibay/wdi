CREATE TABLE tshirts (
	id serial primary key,
	shirt varchar(50),
	price money,
	quantity int,
	imageURL varchar,
	order_id int
);

CREATE TABLE users (
	id serial primary key,
	name varchar(50),
	email varchar(50)
);

CREATE TABLE orders (
	id serial primary key,
	user_id int
);