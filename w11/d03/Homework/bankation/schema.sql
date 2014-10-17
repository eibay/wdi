CREATE DATABASE bankofdan;

\c bankofdan;

CREATE TABLE users(
id serial primary key,
email varchar(255),
password_digest text,
balance integer
);
