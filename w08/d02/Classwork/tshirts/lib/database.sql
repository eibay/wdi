CREATE DATABASE tshirts;
\c tshirts;
CREATE TABLE sales(quanity integer,  id serial primary key, tshirt_id integer, email varchar(250), pending boolean);
CREATE TABLE shirts(name varchar(250), url varchar(250), price integer, quanity integer,  id serial primary key);

