CREATE TABLE photos(album_id integer,id serial primary key,filename text);

CREATE TABLE albums(
	name text,
	id serial primary key,
	event_id integer,
	client_id integer
);

CREATE TABLE clients(id serial primary key,name text);

CREATE TABLE events(
	id serial primary key,
	type text
);














