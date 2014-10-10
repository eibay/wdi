CREATE TABLE books(
id serial primary key,
title varchar(255),
borrowed boolean,
borrower_id int
);

CREATE TABLE borrowers(
id serial primary key,
name varchar(255)
);
