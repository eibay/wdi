CREATE TABLE senators (
  id serial primary key,
  first varchar(50),
  last varchar(50),
  state varchar(50),
  bioguide_id varchar(20),
  party varchar(50),
  dob date
);


CREATE TABLE bills (
id serial primary key,
short_title varchar(255),
senator_id integer,
pages integer,
introduced date,
enacted boolean
);