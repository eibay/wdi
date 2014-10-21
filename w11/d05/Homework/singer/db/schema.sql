CREATE DATABASE singers;

\c singers;

CREATE TABLE artists(
id serial primary key,
name varchar(225),
genre varchar(225),
number_of_albums integer
);

CREATE TABLE songs(
id serial primary key,
name varchar(225),
artist_id integer
);