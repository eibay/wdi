CREATE DATABASE bank;

\c bank

CREATE TABLE users (
id serial primary key,
email varchar(255),
savings integer,
password_digest text
);