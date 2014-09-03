CREATE TABLE authors(
	name varchar(223),
	id serial primary key,
	email varchar(224)
);

CREATE TABLE posts(
	content text,
	author_id integer,
	title varchar(225),
	keyword varchar(50),
	id serial primary key,
	created_at timestamp
);

CREATE TABLE images(
	url text,
	id serial primary key,
	post_id integer references(posts.id), #referential integrity check
	title varchar(100)
);

#fyi this is just a scratchpad
-- paste this in psql