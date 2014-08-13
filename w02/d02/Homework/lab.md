### MovieDB!

```ruby
movie_db = [
  {
      name:"The Shawshank Redemption",
      rating:"9.2",
      rank:"1",
      link:"http://www.imdb.com/title/tt0111161/",
      year:"1994"
   },
   {
      name:"The Godfather",
      rating:"9.2",
      rank:"2",
      link:"http://www.imdb.com/title/tt0068646/",
      year:"1972"
   },
   {
      name:"The Godfather: Part II",
      rating:"9.0",
      rank:"3",
      link:"http://www.imdb.com/title/tt0071562/",
      year:"1974"
   },
   {
      name:"Pulp Fiction",
      rating:"8.9",
      rank:"4",
      link:"http://www.imdb.com/title/tt0110912/",
      year:"1994"
   },
   {
      name:"The Good, the Bad and the Ugly",
      rating:"8.9",
      rank:"5",
      link:"http://www.imdb.com/title/tt0060196/",
      year:"1966"
   },
   {
      name:"The Dark Knight",
      rating:"8.9",
      rank:"6",
      link:"http://www.imdb.com/title/tt0468569/",
      year:"2008"
   },
]
```


#### A movies index page
`/movies`

The page should show a list of all the movies in the db and list them as follows with the name of the title and a link:
```html
<ol>
  <li><a href="/movies/The%20Shawshank%20Redemption">The Shawshank Redemption</a></li>
  <!-- and so on..-->
</ol>
```


#### A page for each movie
Given:
`/movies/The%20Dark%20Night`

The page should show the title, rating, the year it was made, and a link to the imdb.
