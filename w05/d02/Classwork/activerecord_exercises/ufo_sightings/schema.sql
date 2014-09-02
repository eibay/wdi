
-- run this w/ 
-- $ psql -d ufo_sightings -a -f schema.sql

CREATE TABLE ufos (
	id serial primary key, 
	sighted_at varchar(16),
	reported_at varchar(16), 
	location varchar(130),
	shape varchar(10), 
	duration varchar(30),
	description text
);

-- where 

-- sighted_at & reported_at are both x 
-- ufo[x].length => 8 

-- & shape & duration are 
-- varchar_size for "shape"

