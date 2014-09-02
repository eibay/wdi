##UFO
---

Use the provided `ufo_formatted.json` to fill a database of UFO sightings.

Before you go about creating the database and tables, load the file into pry and explore the data.
- What data type does the information need to be for you to use ActiveRecord to enter it into your database?

**NOTE**: The dataset is huge, you will NOT be able to copy and paste it into pry. Even opening the file in a text editor could potentially slow down the text editor and your computer.

Part 1 - Creating the Database
- How many tables will you need?
  - What will you name it/them?
- How might I want to query this data?
  - I.E. Even if I do not yet know how the data will ultimately be used, what are some potential queries that someone might want to run?
- What fields will your table require?
- What data types should these fields have?
- Do you need an `id serial primary key`? Why or why not?

Part 2 - Creating entries in the database
- Create a command line application called `seed.rb` that takes every element in the `sightings` array and creates a new entry for it in your database
- Consider:
  - What files will be required for you to run `seed.rb` and actually have new database entries be created?
  - Where does ActiveRecord fit into this application?
- This application will NOT need any sort of 'front-end' or 'user interface'. It should simply be entering information into Postgres every time it is run

Part 3 - Querying the Database
- Created a file called `queries.rb` and use ActiveRecord to query the database for the below information:
  - Every UFO sighting with a `shape` of `circle`
  - Find the ID of a random UFO sighting
  - Every UFO sighting between 1975 and 2006
  - Every UFO sighting in August of 2010
  - Find the 10 oldest UFO sightings by date
