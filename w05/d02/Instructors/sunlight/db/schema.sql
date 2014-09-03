CREATE TABLE senators(
  fname varchar(255),
  lname varchar(255),
  state varchar(2),
  bioguide_id varchar(7),
  id serial primary key,
  party varchar(3),
  birthday date
);

CREATE TABLE bills(
  senator_bioguide_id varchar(7),
  short_title varchar(255),
  page_length integer,
  enacted boolean,
  id serial primary key,
  introduction_date date
);