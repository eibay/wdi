CREATE DATABASE randoms;
\c randoms;
CREATE TABLE users (name varchar(250), job varchar(250), id serial primary key);
CREATE TABLE comments (comment text, random_id integer);