
-- run this w/ 
-- $ psql -d ufo_sightings -a -f schema.sql

CREATE TABLE ufos (
	id serial primary key, 
	sighted_at date, 
	reported_at date, 
	location varchar(130),
	shape varchar(10), 
	duration varchar(30),
	description text
);

-- where shape & duration are 
-- varchar_size for x

