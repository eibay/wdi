### Sunlight

Using the Sunlight API - https://sunlightlabs.github.io/congress/ - find all Senators whose terms end on 2015-01-03 (ie, senators up for reelection.). Save to a postgresql database, using ActiveRecord, those senators first, last, state, bioguide_id, party, and birthday.

Then, also using the Sunlight API, obtain the most recent 0 - 10 bills proposed by those Senators. Save these bills in another table in your database, retaining the short title, number of pages, whether it has been enacted, and the date it was introduced.

In pry, make sure you can query for a senator and call `senator.bills` to see the list of bills they've sponsored.

Consider:
  * What should the database be called.
  * What will you name your tables, and what fields will each have?\
  * Do you need an `id serial primary key`? Why or why not?

Bonus:

Create a simple front end so a user can browse the data you have collected.