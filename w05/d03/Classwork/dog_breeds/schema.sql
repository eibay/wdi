CREATE TABLE dogs (
	id serial primary key,
	name varchar(50),
	breed varchar(50)
);

CREATE TABLE images (
	id serial primary key,
	dog_id integer,
	image_link varchar(50)
);