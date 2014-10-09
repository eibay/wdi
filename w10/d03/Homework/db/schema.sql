CREATE TABLE books(
  id serial primary key,
  title varchar(255),
  child_id integer
);

CREATE TABLE children(
  id serial primary key,
  name varchar(255)
);

CREATE TABLE borrows(
	id serial primary key,
	book_id integer,
	child_id integer,
	checked_out timestamp
);