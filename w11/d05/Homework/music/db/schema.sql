CREATE TABLE artists(
id serial primary key,
name varchar(50),
genre varchar(50),
number_of_albums integer
);

CREATE TABLE songs(
id serial primary key,
name varchar(50),
artist_id integer
);