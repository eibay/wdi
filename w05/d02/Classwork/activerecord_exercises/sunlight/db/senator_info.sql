CREATE TABLE senators (
id serial primary key,
first_name varchar(50),
last_name varchar(50),
state varchar(2),
bioguide_id integer,
party varchar(1),
birthday date
);


CREATE TABLE bills (
id serial primary key,
bioguide_id integer,
short_title varchar(200),
pages integer,
enacted boolean,
issued_on date
);

		