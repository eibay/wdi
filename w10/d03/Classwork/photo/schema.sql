CREATE DATABASE photography;
\c photography;
CREATE TABLE photos(id serial primary key, taken timestamp,album_id integer);
CREATE TABLE clients(id serial primary key, name varchar(250), email varchar(250));
CREATE TABLE albums(id serial primary key, client_id integer, category_id integer, title varchar(250), event_date date);
CREATE TABLE categories(id serial primary key, name varchar(250));