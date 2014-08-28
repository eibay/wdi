##Week04-Day04

---
###Part 1: Writeup
- **GOAL**: Think about the benefits and goals of using a database
- **SPEC**:
  - Create a file called ```writeup.txt``` to record your answers to the following questions:
    - In your own words: what is a database?
    - List some problems with using files instead of a database
    - What is a schema (google may confuse you here)
    - When you are not specifically adding/deleting or querying your database, is it still running?

###Part 2: Fun with tables
- **GOAL**: Practice creating and querying tables with a SQL database
- **SPEC**:
  - Create a file called ```outputs.txt```. Throughout this homework you will be copying output from your terminal after running a specific command and pasting it into this ```output.txt```.
  - Create a database called ```tablefun```
  - Create the following tables **in that database** with the specified fields
    - *Schools Table*:
      - Create a table called ```schools```
      - Add the fields ```name```, ```city```, and ```state``` as ```varchar```s
      - Add the field ```zip``` as a varchar of 5 characters
      - Add 3 schools with different data into the table
      - Select all schools and copy and paste the output in the terminal to ```outputs.txt```
      - Show the structure of the table by typing ```\d schools``` and copy and paste this output into ```outputs.txt```
      - Change every school's name to "Manhattan High". Select all schools again and copy and paste this output into ```outputs.txt```
    - *Teachers Table*:
      - Create a table called ```teachers```
      - Add the fields ```name```, ```email``, and ```subject``` as ```varchar```s
      - Add the field ```age``` as an integer
      - Add 2 teachers with the subject ```math``` and 4 teachers in various other subjects
      - Select all teachers and copy and paste the output in the terminal to ```outputs.txt```
      - Show the structure of the table by typing ```\d teachers``` and copy and paste this output into ```outputs.txt```
      - **Bonus** update every math teacher to be 40 years old. Put the SQL statement you used into your ```outputs.txt```
      - Delete all math teachers. Copy and paste the SQL statement you used into ```outputs.txt```
- **BONUS**:
  - Create the following tables
    - *Mechanics Table*
      - Add the fields ```id``` and ```name``` where ```id``` is of type ```serial primary key```
    - *Cars Table*
      - Add the fields ```id``` ```make``` ```model``` and ```mechanic_id```. ```id``` is of type ```serial primary key``` and ```mechanic_id``` is of type ```integer```
    - Fill these tables with some sample data
      - do not provide an ```id``` for entries in either table. If you can explain why you do not need to do this add it to your ```writeup.txt```
      - make sure that each car has a ```mechanic_id``` that corresponds to the ```id``` of an existing mechanic
      - there should be at least 2 cars with the same mechanic
    - Run ```\d``` and ```SELECT *``` on each of these tables and copy and paste the output into the output into ```outputs.txt```
    - **Super Bonus**
      - Can you figure out how to select all cars that a specific mechanic is working on **using just the mechanics name**? Hint: google the ```JOIN``` command. If you pull this off copy and paste the SQL statement you used into ```outputs.txt```.
