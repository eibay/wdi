CREATE TABLE sightings(
	sighted_at date,
	reported_at date,
	location varchar(150),
	shape varchar(50),
	duration varchar(50),
	description text,
	id serial primary key
);