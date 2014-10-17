CREATE DATABASE songs_artists;
\c songs_artists;
CREATE TABLE artists (name varchar(250), genre varchar(250), number_of_albums integer, id serial primary key);
CREATE TABLE songs (name varchar(250), artist_id integer, id serial primary key);