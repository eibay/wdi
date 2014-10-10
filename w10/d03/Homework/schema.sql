CREATE TABLE children(id serial primary key, name varchar(255));
CREATE TABLE books(id serial primary key, name varchar(255));
CREATE TABLE borrowed_books(id serial primary key, child_id integer, book_id integer);