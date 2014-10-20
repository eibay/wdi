CREATE DATABASE bank;

\c bank;

CREATE TABLE users(
id serial primary key,
name varchar (255),
email varchar (255),
password_digest varchar (255),
balance integer
);