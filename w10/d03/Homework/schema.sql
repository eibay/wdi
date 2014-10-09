CREATE TABLE users(
  id serial primary key,
  name varchar(255),
  book_id integer,
  borrow_date timestamp
);

CREATE TABLE books(
  id serial primary key,
  name varchar(255)  
);
