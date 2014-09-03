CREATE DATABASE congress;

CREATE TABLE senators(
first_name varchar(50),
last_name varchar(50),
state varchar(50),
bioguide_id varchar(50),
party varchar(50),
birthday date
);

CREATE TABLE bills(
short_title varchar(50),
pages integer,
enacted boolean,
introduced date
);