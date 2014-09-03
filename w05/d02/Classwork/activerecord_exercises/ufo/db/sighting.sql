CREATE TABLE sightings (
id serial primary key,
sighted_at date,
reported_at date,
location varchar(100),
shape varchar(100),
duration varchar(100),
description text
);
