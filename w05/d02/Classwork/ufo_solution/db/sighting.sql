CREATE TABLE sightings (
id serial primary key,
sighted_at date,
reported_at date,
shape varchar(100),
location varchar(100)
duration varchar(100),
description text
);
