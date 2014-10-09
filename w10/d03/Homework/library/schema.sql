CREATE TABLE children(
	id serial primary key,
	name varchar(225)
);

CREATE TABLE books(
	id serial primary key,
	title varchar(225)
);

CREATE TABLE loans(
	id serial primary key,
	child_id integer,
	book_id integer
);