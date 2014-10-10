CREATE TABLE photos(
	id serial primary key,
	album_id integer,
	data varchar(255)
);

CREATE TABLE albums(
	id serial primary key,
	name varchar(255),
	event_id integer,
	client_id integer
);

CREATE TABLE events(id serial primary key, type varchar(255));

CREATE TABLE clients(id serial primary key, name varchar(255));