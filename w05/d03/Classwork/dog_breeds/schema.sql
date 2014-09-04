CREATE DATABASE dogs;

CREATE TABLE breeds(
id serial primary key,
breed varchar(50),
image_url varchar(200)
);

CREATE TABLE dogs(
id serial primary key,
breed varchar(50),
image_url varchar(200)
);
