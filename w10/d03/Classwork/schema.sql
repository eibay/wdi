CREATE DATABASE smileforthecamera;

\c artsy

CREATE TABLE photos (
  id serial primary key,
  album_id integer,
  date_taken timestamp
);

CREATE TABLE clients (
  id serial primary key,
  name varchar(250)
);

CREATE TABLE albums (
  id serial primary key,
  title varchar(250),
  client_id integer,
  category_id integer,
  event_date date
);

CREATE TABLE categories (
  id serial primary key,
  name varchar(250)
);