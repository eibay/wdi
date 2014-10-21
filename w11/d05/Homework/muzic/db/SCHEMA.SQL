CREATE TABLE artists (id serial primary key, name varchar(255), genre varchar(255), number_of_albums integer);


CREATE TABLE songs (id serial primary key, name varchar(255));

CREATE TABLE albums (id serial primary key, name varchar(255), artist_id integer, song_id varchar(255));