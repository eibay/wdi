### MovieDB!

require 'socket'
require 'pry'
require 'URI'

server = TCPServer.new 2000

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
   }
]

   def details(db, index, client)
      db[index]
      client.puts [:name]
      client.puts [:rating]
      client.puts [:rank]
      client.puts [:link]
      client.puts [:year]
   end


   while true
      client = server.accept
      request = client.gets
      path = request.split(" ")[1]
      puts "hello"


      index = 0
      movies = movie_db[index][:name] ########


      # name = path.split("/")[2]

# binding.pry

      # def method
      #    n = movie_db.length - 1
      #    movies = []
      #    while n >= 0 do
      #    # title = movie_db[n][:name]
      #    # link = movie_db[n][:link]
      #    moviename = movie_db[n][:name]

      #    n -= 1

      #    movies << moviename
      #    return movies
      #    end
      # end


      # moviename = movie_db[n][:name]

      if path == "/movies"

         client.puts "<html> <ol>"
         n = movie_db.length - 1
         movies = []
         while n >= 0 do
         # title = movie_db[n][:name]
         # link = movie_db[n][:link]
         moviename = movie_db[n][:name]
         client.puts "<li> <a href='/#{moviename}'> #{moviename} </a> </li>"

         n -= 1

         movies << moviename

         end
         client.puts "</html> </ol>"


         # m = movie_db.length - 1
         
         # while m >= 0 do
         #    if path == "/#{name[m]}"
         #       client.puts "rating: #{movie_db[m][1]}"
         #       client.puts "rank: #{movie_db[m][2]}"
         #       client.puts "link: #{movie_db[m][3]}"
         #       client.puts "year: #{movie_db[m][4]}"

         #    end
         # m -= 1
         # end

      # elsif path == "/movies/#{name}"
      #    if method.include?(name)
      #       client.puts 

      #    end


      else
         # movie_db.each do |movie|
         #    n = 0
         #    check_array = []
         #    while n < 7 do
         #       movie_name = [:name]
         #       n += 1
         #       check_array << movie_name 
         #    end
         # end
         # if check_array.include?(name)
         #    details(movie_db, )

         case path
         when "/#{movie_db[0][:name]}" 
            client.puts "<html><ul>"
            client.puts "<li>name: #{movie_db[0][:name]} </li>"
            client.puts "<li>rating: #{movie_db[0][:rating]} </li>"
            client.puts "<li>rank: #{movie_db[0][:rank]} </li>"
            client.puts "<li>link: #{movie_db[0][:link]} </li>"
            client.puts "<li>year: #{movie_db[0][:year]} </li>"
            client.puts "</ul></html>"
         when "/#{movie_db[1][:name]}" 
            client.puts "<html><ul>"
            client.puts "<li>name: #{movie_db[1][:name]} </li>"
            client.puts "<li>rating: #{movie_db[1][:rating]} </li>"
            client.puts "<li>rank: #{movie_db[1][:rank]} </li>"
            client.puts "<li>link: #{movie_db[1][:link]} </li>"
            client.puts "<li>year: #{movie_db[1][:year]} </li>"
            client.puts "</ul></html>" 
         when "/#{movie_db[2][:name]}" 
            client.puts "<html><ul>"
            client.puts "<li>name: #{movie_db[2][:name]} </li>"
            client.puts "<li>rating: #{movie_db[2][:rating]} </li>"
            client.puts "<li>rank: #{movie_db[2][:rank]} </li>"
            client.puts "<li>link: #{movie_db[2][:link]} </li>"
            client.puts "<li>year: #{movie_db[2][:year]} </li>"
            client.puts "</ul></html>"
         when "/#{movie_db[3][:name]}" 
            client.puts "<html><ul>"
            client.puts "<li>name: #{movie_db[3][:name]} </li>"
            client.puts "<li>rating: #{movie_db[3][:rating]} </li>"
            client.puts "<li>rank: #{movie_db[3][:rank]} </li>"
            client.puts "<li>link: #{movie_db[3][:link]} </li>"
            client.puts "<li>year: #{movie_db[3][:year]} </li>"
            client.puts "</ul></html>"
         when "/#{movie_db[4][:name]}" 
            client.puts "<html><ul>"
            client.puts "<li>name: #{movie_db[4][:name]} </li>"
            client.puts "<li>rating: #{movie_db[4][:rating]} </li>"
            client.puts "<li>rank: #{movie_db[4][:rank]} </li>"
            client.puts "<li>link: #{movie_db[4][:link]} </li>"
            client.puts "<li>year: #{movie_db[4][:year]} </li>"
            client.puts "</ul></html>"
         when "/#{movie_db[5][:name]}" 
            client.puts "<html><ul>"
            client.puts "<li>name: #{movie_db[5][:name]} </li>"
            client.puts "<li>rating: #{movie_db[5][:rating]} </li>"
            client.puts "<li>rank: #{movie_db[5][:rank]} </li>"
            client.puts "<li>link: #{movie_db[5][:link]} </li>"
            client.puts "<li>year: #{movie_db[5][:year]} </li>"
            client.puts "</ul></html>"
         end





            # || name == movies.db[1][:name] || name == movies.db[2][:name] || name == movies.db[3][:name] || name == movies.db[4][:name] || name == movies.db[5][:name]
      #       # should probably put this into an array called acceptable names. but i'm too exhausted right now
      
      # else 
      #    path == 










      # else
      #    m = 0

      #    while m =< movie_db.length - 1 do

      #    client.puts "rating: #{movie_db[m][1]}"
      #    client.puts "rank: #{movie_db[m][2]}"
      #    client.puts "link: #{movie_db[m][3]}"            
      #    client.puts "year: #{movie_db[m][4]}"
         
      #    m 




      end



   end


# #### A movies index page
# `/movies`

# The page should show a list of all the movies in the db and list them as follows with the name of the title and a link:
# ```html
# <ol>
#   <li><a href="/movies/The%20Shawshank%20Redemption">The Shawshank Redemption</a></li>
#   <!-- and so on..-->
# </ol>
# ```


# #### A page for each movie
# Given:
# `/movies/The%20Dark%20Night`

# The page should show the title, rating, the year it was made, and a link to the imdb.
