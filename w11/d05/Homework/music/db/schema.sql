CREATE DATABASE music;

\c music;

CREATE TABLE artists (
id serial primary key,
name varchar(255),
genre varchar(255),
number_of_albums integer
);

CREATE TABLE songs (
id serial primary key,
name varchar(255),
artist_id integer
);

INSERT INTO artists (name, genre, number_of_albums) VALUES ('Blondie', 'New Wave/Punk', 40);

DELETE FROM songs WHERE id = 10;