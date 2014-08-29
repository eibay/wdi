-- SPEC:
-- Create a file called outputs.txt. Throughout this homework you will be copying output from your terminal after running a specific command and pasting it into this outputs.txt.
-- Create a database called tablefun
-- Create the following tables in that database with the specified fields

	-- Schools Table:
-- Create a table called schools
-- Add the fields name, city, and state. Each being of type varchar
-- Add the field zip as a varchar of 5 characters
-- Add 3 schools with different data into the table
-- Select all schools and copy and paste the output in the terminal to outputs.txt
-- Show the structure of the table by typing \d schools and copy and paste this output into outputs.txt
UPDATE schools SET name='Manhattan HS';

CREATE DATABASE tablefun;
CREATE TABLE schools (name varchar(50), city varchar(50), state varchar(50), zip varchar(5) );

INSERT INTO schools (name, city, state, zip) VALUES ('St. Peters Prep', 'Jersey City', 'NJ', 07302);
INSERT INTO schools (name, city, state, zip) VALUES ('St. Anthonys High', 'Jersey City', 'NJ', 07302);
INSERT INTO schools (name, city, state, zip) VALUES ('St. Dominics Academy', 'Jersey City', 'NJ', 07304);

CREATE TABLE teachers (name varchar(50), email varchar(50), subject varchar(50), age integer );
INSERT INTO teachers (name, email, subject, age) VALUES ('Mr. Smith', 'msmith@hello.com', 'Math', 42);
INSERT INTO teachers (name, email, subject, age) VALUES ('Mrs. Pennyhorse', 'pennyhorse@hello.com', 'Math', 39);
INSERT INTO teachers (name, email, subject, age) VALUES ('Mr. Jackson', 'jackson@hello.com', 'Gym', 28);
INSERT INTO teachers (name, email, subject, age) VALUES ('Ms. Swanson', 'swanson@hello.com', 'History', 34);

