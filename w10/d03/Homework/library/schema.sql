CREATE TABLE borrows(
  id serial primary key,
  person_id integer,
  borrowed_date date,
  book_id integer,
);

CREATE TABLE people(
  id serial primary key,
  name varchar(255),
  phone_number integer,
);

CREATE TABLE books(
  id serial primary key,
  name varchar(250),
)

