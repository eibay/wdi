CREATE DATABASE randomusers;

\c randomusers

CREATE TABLE users (
  id serial primary key,
  name varchar(250),
  information text
)

CREATE TABLE comments (
  id serial primary key,
  content text,
  user_id integer
)