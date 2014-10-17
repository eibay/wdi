CREATE DATABASE password_test;

CREATE TABLE users(
  id serial primary key,
  name varchar(255),
  password_digest text
);


