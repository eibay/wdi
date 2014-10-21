CREATE DATABASE music_app;

CREATE TABLE artists(
id serial primary key,
name text,
genre text,
number_of_albums text
);

CREATE TABLE songs(
id serial primary key,
name text,
artist_id integer
);