CREATE DATABASE bank_account;

CREATE TABLE accounts(
id serial primary key,
name text,
email text,
password text,
bank_account integer
);
