CREATE TABLE sightings (
id serial primary key,
sighted_at date,
reported_at date,
location varchar(255),
shape varchar(255),
duration varchar(255),
description text
);