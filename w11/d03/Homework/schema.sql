CREATE DATABASE banking;

CREATE TABLE users (
id serial primary key,
name varchar(255),
email_address varchar(255),
password varchar(25),
balance integer,
account_number varchar(25)
);

-- ALTER TABLE users ADD account_number integer;