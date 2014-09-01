
/* make authors table */

CREATE TABLE authors (
	id serial primary key, 
	name varchar(50), 
	email varchar(45) 
); 

/* make posts table */ 

CREATE TABLE posts (
	id serial primary key,
	subject varchar(50), 
	content varchar(1000), -- limit 1000 chars for post content  
	author_id integer, 
	created_at varchar(10) -- Date.today.to_s.length => 10  
	
); 

/* make images table */ 

CREATE TABLE images (
	id serial primary key,
	src varchar(300),
	alt varchar(600), 
	post_id integer,
	author_id integer, 
	date_created varchar(10) -- Date.today.to_s.length => 10 
); 