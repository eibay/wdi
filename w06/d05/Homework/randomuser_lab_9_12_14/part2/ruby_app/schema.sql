CREATE DATABASE heathers;

CREATE TABLE characters (
first_name varchar(255),
last_name varchar(255),
id serial primary key,
grade varchar(255),
quote text
);
