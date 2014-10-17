CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id serial primary key,
  name varchar(250),
  genre varchar(250),
  number_of_albums integer
);