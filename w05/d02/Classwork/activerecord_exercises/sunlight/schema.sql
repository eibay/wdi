CREATE TABLE senators (
	first_name varchar(15),  
	last_name varchar(15),  
	state_name varchar(15),  
	bioguide_id varchar(15),  
	party char, 
	birthday date 
);

CREATE TABLE bills (
	short_title varchar(200),
	introduced_on date, 
	enacted boolean, 
	pages integer 
);