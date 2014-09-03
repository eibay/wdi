CREATE DATABASE congress;

\c congress;

CREATE TABLE senators (
id serial primary key,
first varchar(100),
last varchar(100),
state varchar (50),
bioguide_id varchar(50),
party varchar(50),
birthday date);

CREATE TABLE bills (
id serial primary key,
bioguide_id varchar(50),
short_title varchar(200),
pages integer,
enacted boolean,
issued_on date);