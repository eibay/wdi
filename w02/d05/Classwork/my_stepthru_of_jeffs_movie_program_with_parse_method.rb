# ////////////////////////////////////////////////////////////////////////

# !TO TEST THIS, MAKE SURE YOUR HTML / CSS PATHS ARE CORRECT IN THE CODE!

 
require 'pry'
require 'json'
require 'socket'

server = TCPServer.new 2000

# equivalent to while true

def parse_url(url)
# this is a method to break down the url into a path and query string parts, 
# and then to put those pieces into a hash

# this is what the end structure should look like:

          # params = {path: "/the_forest",
                #     query_params: {
                  #                 animal: "monkeys"
                  #                 food: "bananas"
                  #                 }
                #           }

          #test url
          # url = "/the_forest?animal=monkey&food=bananas"

  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {} #this is going to be the hash that holds all of our url info in 
              #key/value pairs

  params[:path] = path #this makes the value for key :path the first part of the URL 'path'  - i.e. "/the_forest"

  if query_string == nil  #if there is nothing in the query string, 
                          #ie. no "animal=monkey&food=bananas"

    return params #we just return the params hash,   
                  # now gives us params[:path] = path, in test case path = "/the forest"
  end

          #the indented steps here are just to prep the 'query_params' hash:

          pairs = query_string.split("&") #this splits the string,ie    "animal=monkey&food=bananas" to "animal=monkey" "food=bananas"

          key_values = [] #this is a new array that we are going to fill with the query string details

          pairs.each do |pair| 
            key_values.push(pair.split("=")) #this gives us 2 new arrays [animal, monkey], [food, bananas]
          end

          query_params = {} #this creates the sub-hash in params, that will hold the key-value pairs for the queries key-value info

          key_values.each do |key_value|
            query_params[key_value[0].to_sym] = key_value[1] #we structure our hash here with the key-value pairs we got in 'pairs.each do'
          end

  # so now: query_params  = {animal: monkey
  #                         food: bananas}

  params[:query_params] = query_params #this is adding the new key value pair 
  #to the main params hash set at line 32 (which already has the path key value pair in it)

      # goal of all this code in the parse_url(url) method = to get a structure that looks like this:

      # params = {path: "/the_forest",
      #           query_params: {
      #                 animal: "monkeys"
      #                 food: "bananas"
      #                 }
      #           }

      # For example, to pull "monkeys" (which is nested in 2 hashes): 
      # params[:query_params][:animal] = monkeys

      #in this program below query_params: {specific_word: "user_word"}

  return params
end

loop do #this is the actual program start!

  client = server.accept #this action happens when the client goes to the web page

  request = client.gets #this is the client's page request info

  url = request.split(" ")[1]

  # would give us a url like our test url:
  # url = "/the_forest?animal=monkey&food=bananas"

  params = parse_url(url) #this is where we actually call the method

#QUESTION TO ASK - DOESN'T THIS LITERALLY GIVE US 'PARAMS' = 'PARAMS' because our last line of our def for method parse_url(url) is 'returns params'
                                                                                                   
# binding.pry

  if params[:path] == "/"
    html = File.read('../Instructors/movie-title-classwork/views/index.html')
    client.puts(html)
  elsif params[:path] == "/styles.css"
    css = File.read('../Instructors/movie-title-classwork/stylesheets/styles.css')
    client.puts(css)
  elsif params[:path] == "/words"
    word = params[:query_params][:specific_word]
    omdbapi = TCPSocket.new 'www.omdbapi.com', 80 #this opens our request to connect to omdapi.com
    omdbapi.puts "GET /?s=#{word}" #this formats and sends the request how omdbapi likes it

    response = omdbapi.gets

    omdbapi.close

    parsed = JSON.parse(response) #this translates omdapi's results into a hash, with the key "Search" and a value of a hash of movie records

    #TIP - always check this result in pry so I'm clear on the exact structure that is returned. 

    html = File.read('../Instructors/movie-title-classwork/views/movies.html') #this points to our main html 'results' file page

    html = html.gsub('{{search_word}}', word)

    movies = []
    
      parsed["Search"].each do |movie|
      # this means, for all the values in 'parsed["Search"]' which are smaller hashes 'movie' do the following:

      individual_movie = File.read('../Instructors/movie-title-classwork/views/individual_movie.html') #tip - this is a good place to do the individual html formatting for the individual entries

      individual_movie = individual_movie.gsub('{{title}}', movie["Title"])
      individual_movie = individual_movie.gsub('{{year}}', movie["Year"])
      individual_movie = individual_movie.gsub('{{imdb_id}}', movie["imdbID"])
      movies.push(individual_movie) #this puts each movie's entry with the above info in it, into the movies array
      
      end

    html = html.gsub('{{movies}}', movies.join(''))
    # .join makes the movie entries in the array one long string, so they can be undestood in html
    client.puts(html)

  else
    html = File.read('../Instructors/movie-title-classwork/views/404.html')
    client.puts(html)
  end

  client.close

end

