CREATE DATABASE bank_app;
\c bank_app;
CREATE TABLE accounts(
id serial primary key,
name varchar(100),
password varchar(12),
email varchar(35),
account_balance integer
);

