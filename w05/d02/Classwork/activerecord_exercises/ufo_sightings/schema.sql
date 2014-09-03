CREATE DATABASE ufo_sighting;

CREATE TABLE ufos(
id serial primary key,
sighted_at integer,
reported_at integer,
location varchar(250),
shape varchar(250),
duration integer,
description text
);
