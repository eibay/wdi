-- To enter Postgres Terminal
psql

-- To quit psql
\q

-- To create database
CREATE DATABASE 


-- To connect to a database
\c;


CREATE TABLE senators (
id serial primary key,
first_name varchar(50),
last_name varchar(50),
state_name varchar(50),
bioguide_id varchar(50),
party varchar(100),
birthday date
);


CREATE TABLE bills (
id serial primary key,
sponsor_id varchar(50),
short_title varchar(200),
pages integer,
enacted boolean,
introduced_on date
);




