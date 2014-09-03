# this is just copy paste. not to run

CREATE DATABASE ufo_sightings;

CREATE TABLE ufos (
id serial primary key,
sighted_at integer,
reported_at integer,
location varchar(55),
shape varchar(55),
duration varchar(55),
description text
);