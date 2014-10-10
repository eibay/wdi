CREATE DATABASE joey_b_model;

CREATE TABLE photos(
id serial primary key,
date_taken timestamp,
album_id integer
);

CREATE TABLE clients(
id serial primary key,
name text
);

CREATE TABLE albums(
id serial primary key,
client_id integer,
category_id integer,
title text,
event_date date
);

CREATE TABLE categories(
id serial primary key,
name text
);