CREATE DATABASE accounts;
\c accounts;
CREATE TABLE users(name varchar(250), password_digest varchar(250),amount integer, id serial primary key);
