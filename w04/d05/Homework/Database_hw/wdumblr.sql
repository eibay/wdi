CREATE DATABASE wdumblr;

authors - id, name, email
posts - id, content, created_at, keyword, author_id
images - url, post_id

CREATE TABLE authors (id serial primary key, name varchar(50), email varchar(50));
CREATE TABLE posts (id serial primary key, content varchar(50), keyword varchar(50), author_id integer);
CREATE TABLE images (url varchar(50), post_id integer);