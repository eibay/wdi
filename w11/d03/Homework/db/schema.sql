CREATE DATABASE bank_account;

CREATE TABLE users(
  id serial primary key,
  name varchar(255),
  email text,
  password varchar(255),
  account_id integer
);

CREATE TABLE accounts(
  id serial primary key,
  balance integer,
  user_id integer
);
