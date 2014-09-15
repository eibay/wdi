## Dashboard

---
<span style="color:gray">A dashboard aggregates information for a user from a number of sources. The application offers a list of sources (known as *feeds*), and allows users choose which feeds to receive, and to personalize those feeds, by (among other factors) location and topic or interest.</span>

###***MVP***
- **Data Model**:
  - A `feed` will bring in `post`s - a post being a piece of data from an API feed.
  - A `post` will have a `tag` that will categorize it
- **Required technologies or features**:
  - [Twitter Gem](https://github.com/sferik/twitter)
    - A Ruby wrapper that assists in making requests to the Twitter API
  - [Weather Underground API](http://www.wunderground.com/weather/api/)
  - [New York Times](http://developer.nytimes.com/docs)
- **User Stories (MVP)**:
  - A user can add a personalized `feed` to their dashboard.
    - Example:
      - I enjoy Star Wars, so I can add a Twitter `feed` to my dashboard about Star Wars. When I create this feed, 10 posts should be created.
      - I live in Brooklyn, so I could also add the weather in Brooklyn to my dashboard. When I create this feed, 10 days of weather should be created as posts.
      - I like the news, so I create a feed of NY Times headlines. When I create this feed the most recent 10 headlines should be created as posts.
  - A user can see an aggregation of all their feeds at `/`, but it will only show 10 snippets at at time
  - A user can also see each `feed` individually
  - A user can click on a given `post` to visit the original resource (be it a tweet or an article)
  - A user can choose to delete a `post`
  - A user can add a "topic" or "hashtag" to a post as a `tag`
    - This should be optional to do and the choice of `tag` is up to the user. Not having a `tag` for the `post` should NOT break the application
    - `tag`s can be edited and deleted

---

###***Bonus***

- **Further User Stories**:
  - A user can search a feed's history by tag
- **Incorporate Bundler and a Gemfile into your application**
    - [Bundler Website](http://bundler.io/)
    - [Why use Bundler?](http://bundler.io/rationale.html)
    - [What is a Gemfile?](http://bundler.io/v1.3/gemfile.html)
    - [Sinatra docs for Bundler and Gemfiles](http://recipes.sinatrarb.com/p/development/bundler)
- **Upgrade the Weather data**
  - Weather data does not change very often, so there is no need to constantly query the API.
  - Set up a way to have your application automatically query the Wunderground API once an hour or once a day (depending on how your application is set up) and save the result to your database
  - This will also automatically add a new weather 'post' to the user's stream
  - A user can page through the history of a feed or the aggregate of feeds, but only ten snippets at a time... (`/feed/:id?page=1`)
- **Add additional feeds through the below API sources or pick your own additional sources**
  - [Instagram](http://instagram.com/developer/)
  - [Tumblr](http://www.tumblr.com/docs/en/api/v2)
- **Tag searching (>= 1 of the below or another appropriate API)**:
  - A user can view recent snippets (instagrams, tumblog posts, etc.) associated with a given `post`'s tag alongside other `post`s that share that tag... (`/tags/:tagname/feeds`)
- **Handle JSON Requests**
  - Allow for the user's `feed` and/or the aggregate of feeds (or both) to be sent to a client as JSON
  - Have this accessible through a route called `/as`
  - To get Sinatra to form responses in JSON format rather than HTML, check out this [tutorial](http://nathanhoad.net/how-to-return-json-from-sinatra)
- **Implement responsive web design to your application**
  - [What the heck is responsive web design?](http://johnpolacek.github.io/scrolldeck.js/decks/responsive/)

---
