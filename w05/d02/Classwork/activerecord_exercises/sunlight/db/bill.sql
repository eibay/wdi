CREATE TABLE bill (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	bioguide_id varchar(50),
	party varchar(10),
	birthday date
)