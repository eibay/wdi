CREATE DATABASE dog_breeds;

CREATE TABLE breeds (
	id serial primary key,
	name varchar (255)
);

CREATE TABLE images (
	id serial primary key, 
	breed_id integer, 
	name varchar (255), 
	image text
);