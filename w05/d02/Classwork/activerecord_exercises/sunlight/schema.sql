CREATE TABLE senators (
first varchar(88),
last varchar(88),
state varchar(22),
bioguide_id varchar(22),
party varchar(22),
birthday date
id serial primary key);

CREATE TABLE bills (
short_title varchar(150),
pages integer,
enacted boolean,
introduced date,
id serial primary key,
senator_id varchar(22));