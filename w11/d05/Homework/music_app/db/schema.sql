CREATE DATABASE music_app;
\c music_app;

CREATE TABLE artists(
id serial primary key,
name varchar(100),
genre varchar(100),
number_of_albums integer);

CREATE TABLE songs(
id serial primary key,
name varchar(255),
artist_id integer,
album_id integer);

CREATE TABLE albums(
id serial primary key,
name varchar(255),
artist_id integer
);
