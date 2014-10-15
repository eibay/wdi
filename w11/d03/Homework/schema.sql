CREATE DATABASE accounts;
\c accounts;
CREATE TABLE users(name varchar(250), password varchar(250),amount integer, id serial primary key);
