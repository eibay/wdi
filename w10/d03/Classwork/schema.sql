CREATE TABLE clients (
  id serial primary key,
  name varchar(255)
);

CREATE TABLE albums (
  id serial primary key,
  client_id integer,
  category_id integer,
  title varchar(255)
);

CREATE TABLE photos (
  id serial primary key,
  album_id integer,
  date_taken date
);

CREATE TABLE categories (
  id serial primary key,
  name varchar(255)
);