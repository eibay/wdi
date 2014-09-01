

CREATE TABLE authors (id serial primary key, 
	name varchar(50), 
	email varchar(30)
); 

CREATE TABLE posts (id serial primary key,
	subject varchar(50), 
	content varchar(1000), -- limit 1000 chars for post 
	created_at varchar(), 
	author_id integer 
); 

CREATE TABLE images (id serial primary key,
	src varchar(300),
	alt varchar(600), 
	post_id integer,
	author_id integer
); 