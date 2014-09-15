CREATE DATABASE redshirtapi;
\c redshirtapi;

CREATE TABLE redshirts (
id serial primary key,
fname varchar(255),
lname varchar(255),
nname varchar(255),
town varchar(255),
looks varchar(255),
attitude varchar(255),
last_words text,
xid integer
);

CREATE TABLE comments (
id serial primary key,
redshirt_id integer references redshirts(id),
comment text,
created_at timestamp,
commenter varchar(255)
);