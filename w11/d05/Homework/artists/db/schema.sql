CREATE TABLE artists(
id serial primary key,
name varchar(255),
genre varchar(100),
number_of_albums integer,
photo_url text
);

CREATE TABLE songs(
id serial primary key,
name varchar(255),
artist_id integer
);

