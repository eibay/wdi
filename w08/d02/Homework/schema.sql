CREATE TABLE shirts(
	id serial primary key,
	price integer, 
	image text,
	quantity integer
);

CREATE TABLE users(
	email text,
	shirtID integer,
	quantity integer,
	pending boolean,
);

