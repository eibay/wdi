CREATE TABLE books(
id serial primary key,
title varchar(255)
);

CREATE TABLE children(
id serial primary key,
name varchar(255)
);

CREATE TABLE borrowed_books(
id serial primary key,
book_id integer,
child_id integer
);