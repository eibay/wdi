### Movie Actor Role

Create a 3 model CRUD app using Rails. This app should be a JSON API, and you should test it using HTTParty.

#### Models:

**Movie**
  * id
  * title
  * year
  * poster_url

**Actor**
  * id
  * fname
  * lname
  * picture_url

**Role**
  * id
  * character_name
  * movie_id
  * actor_id

#### Bonus

A command line node app that when you enter `movie_add [title]` in your terminal, your program hits your Rails API with data drawn from https://www.themoviedb.org/. 