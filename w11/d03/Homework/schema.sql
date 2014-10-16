CREATE DATABASE bankaccounts;

\c bankaccounts

CREATE TABLE users (
id serial primary key,
first_name varchar(250),
last_name varchar(250),
email varchar(250),
password varchar(250),
balance integer
);

CREATE TABLE accounts (
id serial primary key,
account_number integer,
name varchar(250),
user_id integer
);
