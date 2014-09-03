CREATE DATABASE sunlight;

CREATE TABLE senators(
id serial primary key,
first varchar(55),
last varchar(55),
state varchar(55),
bioguide_id varchar(200),
party varchar(55),
birthday date
);

CREATE TABLE bills(
id serial primary key,
short_title varchar(200),
pages integer,
enacted boolean,
date_introduced date,
sponsor_id varchar(200),
bill_id varchar(200)
);

  

