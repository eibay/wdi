CREATE DATABASE photo_app;
\c photo_app;

CREATE TABLE photos(
id serial primary key,
album_id integer
);

CREATE TABLE albums(
id serial primary key,
name varchar(255),
category_id integer,
client_id integer,
event_date date
);

CREATE TABLE clients(
id serial primary key,
name varchar(255)
);

CREATE TABLE categories(
id serial primary key,
name varchar(255)
);