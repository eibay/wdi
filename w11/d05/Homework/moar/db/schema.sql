CREATE DATABASE moar_db;

\c moar_db;

CREATE TABLE artists(id serial primary key,name varchar(255),genre varchar(255),number_of_albums integer);
INSERT INTO artists (name, genre, number_of_albums) VALUES ('Neil Young', 'Rock', 42);

CREATE TABLE songs(id serial primary key,name varchar(255),artist_id integer);
INSERT INTO songs (name, artist_id) VALUES ('Helpless', 1);


