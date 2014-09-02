CREATE TABLE authors(
  name varchar(255),
  id serial primary key,
  email varchar(255)
);

CREATE TABLE posts(
  content text,
  author_id integer,
  title varchar(255),
  keyword varchar(50),
  id serial primary key,
  created_at timestamp
);

CREATE TABLE images(
  url text,
  id serial primary key,
  post_id integer references(posts.id),
  title varchar(100)
);