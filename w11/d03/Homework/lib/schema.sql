CREATE DATABASE bank;
\c bank;

CREATE TABLE users (
id serial primary key,
email varchar(255),
password varchar(255),
balance integer
);
