-- NOTES BELOW

-- To enter Postgres Terminal
psql

-- To quit psql
\q

-- To create database
CREATE DATABASE library;

-- To connect to a database
\c library;

CREATE TABLE books(
  id serial primary key,
  title varchar(255),
  author varchar(255)
);

CREATE TABLE users(
  id serial primary key,
  name varchar(255),
  email varchar(255)
);

CREATE TABLE borrowed_books(
  id serial primary key,
  borrowed_date date,
  book_id integer,
  user_id integer
);



-- Return all entries on a table
SELECT * FROM photos;

-- Return entries based on a specified attribute
SELECT * FROM birds WHERE name = 'Lola';

-- To add an entry
INSERT INTO categories (name) VALUES ('friends');
INSERT INTO categories (name) VALUES ('family');
INSERT INTO categories (name) VALUES ('work');

INSERT INTO contacts (name, age, address, phone_number, picture, category_id) VALUES ('Nancy Kaufer', 30, '20 Pine Street, Woodmere, NY 11730', '914-567-3467', 'img/avatar.png', family.id);
INSERT INTO contacts (name) VALUES ('family');
INSERT INTO contacts (name) VALUES ('work');

INSERT INTO monkeys (name, age) VALUES ('Brutus', 13);
INSERT INTO monkeys (name, age) VALUES ('Cletus', 4);


