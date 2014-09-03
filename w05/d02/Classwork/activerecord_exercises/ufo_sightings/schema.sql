CREATE DATABASE ufosightings;

CREATE TABLE ufos (sighted_at integer, reported_at integer, location varchar(100), shape varchar(50), description text, duration varchar(200), id serial primary key);


