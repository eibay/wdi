CREATE DATABASE dog;
\c dog;

CREATE TABLE puppies (
id serial primary key,
name varchar(255),
breed varchar(255),
cuteness integer
);