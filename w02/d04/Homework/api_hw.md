### APIs Homework

We're going to build a site that show's users a list of all the movies with a particular word in it's title.

1. Explore the OMDB search api.
  * Put `http://omdbapi.com/?s=monkey` in your browser.
  * Try a few different words after the `s=` part
  * After you feel like you understand what this API is doing, connect with the OMDB api in `pry`
  ```ruby
    require 'socket'

    client = TCPSocket.new 'www.omdbapi.com', 80
    client.puts 'GET /?s=monkey'

    response = client.gets
    puts response
  ```
  * Practice "parsing" the responses using `JSON.parse` and use enumerables to iterate over these data structures.

2. Review the starter code. Read it line by line and make sure you understand how everything works.

3. Add a new "route" to the server so that it can respond to `/words/word`. The server should respond with an html page that displays all of the movies with that word in it's title. For each matching movie, you should display it's title, the year it was released, and a link to it's IMDB page. You should be able to do all of this with just the information returned form the API. The `index.html` page has three example links. You have succeeded when you can clink on one of those links and see a page with a list of movies that have a title with the word in it.

BONUS

Make the list of word links on the homepage dynamic - ie be generated from a list of words in your ruby server.