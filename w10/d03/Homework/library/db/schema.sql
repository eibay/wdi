CREATE DATABASE library;

CREATE TABLE books (
id serial primary key,
title varchar(255),
borrowed boolean
);

CREATE TABLE borrowedbooks (
id serial primary key,
book_id integer,
child_id integer
);

CREATE TABLE children (
id serial primary key,
name varchar(255)
);