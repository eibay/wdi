CREATE TABLE songs(
id serial primary key,
name varchar(255),
artist varchar(255)
);

CREATE TABLE artists(
id serial primary key,
name varchar(255),
genre varchar(255),
number_of_albums integer
);