CREATE TABLE cars(
  make varchar(255),
  model varchar(255),
  year integer,
  color varchar(255),
  id serial primary key,
  sweet_spoiler boolean,
  photo_url text
);