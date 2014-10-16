CREATE DATABASE bank_acct;

\c bank_acct

CREATE TABLE users (
id serial primary key,
name varchar(255),
email varchar(255),
password varchar(100),
savings integer 
);