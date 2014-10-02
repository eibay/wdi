## Backbone Practice

Create a simple Backbone app.

  * `#/movies` displays a list of your favorite movies
  * `#/books` displays a list of your favorite books
  * `#/hello/NAME` says "Hello, NAME" given any name

There should be a nav bar with links to the first two routes.

**Add a route**

  * `#/200/200` displays a placekitten image for the given dimensions.

**Movie Data**

For each movie in your favorite movies, it should be a clickable link that takes you to a new route, `#/movies/movie-name` that displays the title, year, and poster for that movie. You should retrieve this data dynamically from OMDB using ajax.

**Book Data**

Let's enhance our favorite book list using the Goodreads API. Goodreads does not allows cross site requests using ajax. What does that mean?

For each book in your list, display next to it the overall rating on Goodreads.

  * [Goodreads API](https://www.goodreads.com/api)

**Challenge** (not a bonus - DO THIS!)

A. Add a simple form that allows users to add new books to the list. Don't use any ajax in this part.

B. But, when the user refreshes the page, the added books disappear! Add a button on the book list that says "Save". When the user presses this button, any newly added books are "saved" such that all added books are still on the list when the user reloads the page.

C. Add a delete button next to every book. When a user presses this the book is removed from the list and is still removed when the user refreshes the page. You should be using ajax and *not* full page refreshes for this feature.