CREATE DATABASE bank;

\c bank

CREATE TABLE users(id serial primary key, email varchar(255), password varchar(255));

CREATE TABLE accounts(id serial primary key, user_id integer, balance integer, name varchar(255));