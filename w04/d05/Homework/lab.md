### WDumblr

Goal: Create a blogging web application.

#### Part 1 - Synthesize

1. Copy the `model.rb` file into this new sinatra app.

2. Create two models - Author (name, email), Post (content, created_at, keyword) - and a `console.rb` file which `require_relative`s your models.
  - (**FYI** - the keyword should be one word that sums up the post). Explore these models on the command line in pry from `console.rb`. Be able to call `author.posts` and `post.author`.

3. GET Routes:
  * `/` -> links to `/authors` and `/posts`
  * `/authors` -> shows all the authors (with links to their `/authors/:id` page) and a link to `/authors/new`
  * `/authors/new` -> a form to create a new author
  * `/posts` -> all the posts with links to their `/posts/:id` page and a link to create a new post.
  * `/posts/:id` -> the post (with a byline, ie who authored the post)
  * `/posts/new` -> a form to create a new post.

4. Add a third model. Each Post can have several images associated with it. Create an Image model. Back in `console.rb` make sure you can create images that belong to a post and call `post.images` and `image.post`.

5. New Routes

  * `/posts/:id` -> now contains a button below the post content that says "Add Images"

    * when pressed, it hits the server at POST `/posts/:id/images`
    * The server will hit the Instagram API and create 3 new images for the given post using the post's keyword as the search tag for Instagram.
  * And, when you look at `/posts/:id` you should see all of the images associated with that post along with the post content.

#### Part 2 - Self-guided Learning

We learned in Neel's lecture yesterday that files aren't the best place to keep our data. Let's use a database instead!

1. Create a database called `wdumblr`

2. Create tables for
  * `authors` - id, name, email
  * `posts` - id, content, created_at, keyword, author_id
  * `images` - url, post_id

  Yesterday, we only connected to our postgres database server using `psql`. Today, we will connect to postgres from our ruby program.

<<<<<<< HEAD
3. Read Sections 1 - 3, and 5 of the (ActiveRecord Basics)[http://guides.rubyonrails.org/active_record_basics.html] documentation.
=======
3. Read Sections 1 - 3, and 5 of the [ActiveRecord Basics](http://guides.rubyonrails.org/active_record_basics.html) documentation.
>>>>>>> ca8cf57ae7ea041ca478023ac37c49f3bcea9f59

  Create a folder in today's `Homework` folder called `reflection`.

  Reflect - based on what you've read please write up your thoughts on the following in `/Homework/reflection/writeup.txt`:
    * Compare and contrast the `Model` class we have been using to `ActiveRecord`
    * What is ActiveRecord doing? How does it relate to our database server?
    
  Further Reading:
    * ActiveRecord is an ORM [Object Relational Mapping](http://en.wikipedia.org/wiki/Object-relational_mapping) software that is commonly used with Ruby.
    * Read the *Overview* and *Simple Explanation* headings in the above link

4. Make a copy of the entire sintra app into a new folder called `wdumblr_with_db`

5. Connect to postgres from ruby.
  - Type `gem install activerecord` into your console
  - Create a file called `connection.rb` and add the following code:
  ```ruby
    require 'active_record'

    ActiveRecord::Base.establish_connection({
      :adapter => "postgresql",
      :host => "localhost",
      :username => "",
      :database => ""
    })

    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ```

  **Be sure to add your own username and `wdumblr` as the database.**

6. Replace your models with ActiveRecord models.
  * `require_relative` `connection.rb` at the top of your `console.rb` file
  * Using the ActiveRecord documentation, replace the models we have been using (which persist data to a file) with ActiveRecord models.
  * Open your `console.rb` file and practice creating, finding, updating, and deleting authors, posts, and images in pry
  * **Take note of the output in your console** ActiveRecord should be logging the SQL statements it is using to communicate with your database.
  * Create instance methods such that `post.images`, `author.posts`, and `post.author` works as before.
  * Using `psql` verify that the data you've been creating, updating, and deleting is reflected in your database.

7. Fix your WDumblr app so that it works with your new ActiveRecord models.
  * Put the following code at the top of your `server.rb`, before the routes but after your require statements. 
  ```ruby
    require_relative './connection'

    after do
      ActiveRecord::Base.connection.close
    end
  ```
  * Fix any code that broke, and enjoy your new database-backed web app!

#### Part 3 - Reflect

A) Draw a diagram of the following components and their interactions (as well as the protocols they use to interact):
  * DB server (postgresql)
  * server.rb
    * ActiveRecord
    * sintra
    * HTTParty (Instagram API)
  * Client's web browser
  * psql

Please take a photo of this diagram and put it in the `reflection` folder. 

B) In `reflection/writeup.txt` please explain the distinction between:
  * Postgresql database server
  * Wdumblr database
  * authors, posts, and images tables
  * psql
  * ActiveRecord

Which component receives and interprets SQL statements? Which component connects to the postgresql database server? What kind of data (string, integer, other...) does it send and receive?
