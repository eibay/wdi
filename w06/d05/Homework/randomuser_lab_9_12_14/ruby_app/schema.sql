CREATE TABLE comments(
	id SERIAL PRIMARY KEY,
	user_id VARCHAR(11), 
	content TEXT  
);