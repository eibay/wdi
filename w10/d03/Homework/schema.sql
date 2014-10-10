CREATE TABLE children(
	name varchar(255),
	id serial primary key
);

CREATE TABLE books(
	name varchar(255),
	id serial primary key
);

CREATE TABLE borrowedbooks(
	id serial primary key,
	book_id integer,
	child_id integer
);

