CREATE TABLE senators (
id serial,
fname varchar(255),
lname varchar(255),
state varchar(2),
bioguide_id varchar(20) primary key,
party varchar(1),
birthday date
);

CREATE TABLE bills (
sen_id varchar(20) REFERENCES senators (bioguide_id),
short_title varchar(255),
length integer,
enacted boolean,
intro_date date
);