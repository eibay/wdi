CREATE TABLE tshirts(
	id serial primary key,
	name varchar(50),
	price varchar(50),
	quantity integer,
	image varchar(200)
);

CREATE TABLE users(
	id serial primary key,
	tshirt_id integer,
	quantity integer,
	email varchar(50)
);

