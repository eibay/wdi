CREATE DATABASE congress;

CREATE TABLE senators (
id serial primary key,
first varchar(100),
last varchar(100),
state varchar(100),
bioguide_id varchar(100),
party varchar(100),
birthday date
);

CREATE TABLE bills (
id serial primary key,
short_title varchar(200),
pages integer,
enacted boolean,
introduced varchar(100),
senator_id integer
);


-- first, last, state, bioguide_id, party, and birthday.

-- short title, number of pages, whether it has been enacted, and the date it was introduced.

