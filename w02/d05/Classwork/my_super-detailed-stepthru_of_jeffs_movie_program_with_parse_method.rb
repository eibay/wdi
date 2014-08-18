
# without binding.pry when i just load the server and the port and the right page pops up
# type a word in the search box on the page, it registers in the browser as 

# http://127.0.0.1:2000/words?specific_word=blood

# BUT when trying to go to the page, it says: 

          # No data received
          # Unable to load the webpage because the server sent no data.
          # Error code: ERR_EMPTY_RESPONSE

# how did I try to test/debug?

#       doing pry and binding.pry checks on different variables to understand what they are doing (but binding.pry never opened the page, so i couldn't type a word in)

#       checking that paths are correct


# what else can I try to test/debug? 

#       step away from it

#       see how Instructors version of this program works
#       ### THIS WORKED! SO GLAD I TRIED IT FIRST. PROBLEM WAS A SMALL SYNTAX ERROR. LESSON - CHECK AND RE-CHECK SYNTAX FIRST IN THE TROUBLE SHOOTING PROCESS!

# put binding.pry at the START of the conditional

#       call variables request, url, path, query_string, query_params, params

#       A. with just IP and port in browser

#               no page loads, it just says 'waiting for 127, etc.'
#               when i go in pry, i can check for the variables

#                 # request
#                 =>"GET / HTTP/1.1\r\n"

#                 gives us just '/' or the root or the homepage

#                 # url
#                 => "/"

#                 # path
#                 => NameError: undefined local variable or method `path' for main:Object
#                 from (pry):3:in `block in <main>'
#                 -same error as when we used the path '/words' below

#                 # query_string 
#                 => NameError: undefined local variable or method `query_string' for main:Object
#                 from (pry):4:in block in <main>
#                 -diff error than with path '/words' below (which was nil)

#                 # query_params 
#                 =>NameError: undefined local variable or method 'query_params' for main: Object
#                 from (pry):5:in 'block in <main>'

#                 # params
#                 => {
#                     :path => "/"
#                 }


#       B. with just IP, port and path: http://127.0.0.1:2000/words
              
#               no page loads, it just says 'waiting for 127, etc.'
#               when i go in pry, i can check for the variables

#                           request
#                           =>"GET /words HTTP/1.1\r\n"

#                           url
#                           =>"/words"

#                           path
#                           =>NameError: undefined local variable or method `path' for main:Object
#                           from (pry):3:in `block in <main>

#                           why do we get this? well, the equation that creates path wont work because it tries to split the url with a '?' and we dont have one in this url
#                             'path = url.split("?")[0]'

#                           query_string 
#                           => nil 
#                           why didnt we get nil when calling path tho? its called the same way as path was
#                             'query_string = url.split("?")[1]'

#                           query_params 
#                           =>NameError: undefined local variable or method 'query_params' for main: Object
#                           from (pry):5: in block in <main>

#                           params
#                           => {
#                               :path => "/words"
#                           }

#                           Question - how does path show up here in the hash, but not when we call the variable hash above?


#       C. with just IP, port and path http://127.0.0.1:2000/words?specific_word=blood

#                 no page loads, it just says 'waiting for 127, etc.'
#                 when i go in pry, i can check for the variables

#                 # request
#                 => "GET /words?specific_word=blood HTTP/1.1\r\n"

#                 # url
#                 => "/words?specific_word=blood"

#                 # path
#                 => NameError: undefined local variable or method 'path' for main:Object
#                 from (pry):3:in 'block in <main>'
#                 really, why isnt this returning as '/words' here, esp. when it shows up in the params hash correctly?

#                 # query_string 
#                 => NameError: undefined local variable or method 'query_string' for main:Object
#                 from (pry):4:in 'block in <main>'
#                 why would i get this NOW, when i gave a query string in the path?


#                 # query_params 
#                 => NameError: undefined local variable or method 'query_params' for main:Object
#                 from (pry):5:in 'block in <main>'

#                 # params
#                 => {
#                             :path => "/words",
#                     :query_params => {
#                         :specific_word => "blood"
#                     }
#                 }

#                 how come it all lists perfectly in params, but not the individual pieces?


#                 put binding.pry at the END of the conditional

#                       call variables response and parsed

#                   with just IP and port in browser
#                       the browser page goes blank and it hangs (doesnt even have msg at bottom about waiting for 127...

#                       response
#                       =>nil (makes sense, because i wouldn't have sent anything to the api)
#                       parsed
#                       =>=>nil (makes sense, because i wouldn't have sent anything to the api)
                    
#                   with just IP, port and path http://127.0.0.1:2000/words

#                 I got this msg on browser page: This webpage is not available: Google Chrome's connection attempt to 127.0.0.1 was rejected. The website may be down, or your network may not be properly configured.
#                 but when i removed the binding.pry, the program ran fine in the browser

#                 In pry though, I got this mistake before it closed pry on its own:
#                 my_stepthru_of_jeffs_movie_program_with_parse_method.rb:291:in `block in <main>': undefined method `[]' for nil:NilClass (NoMethodError)
#                   from my_stepthru_of_jeffs_movie_program_with_parse_method.rb:267:in `loop'
#                   from my_stepthru_of_jeffs_movie_program_with_parse_method.rb:267:in `<main>'

#                 so i couldnt even check to see what these values mean

#                       response
#                       => 
#                       parsed
#                       =>

#   with just IP, port and path http://127.0.0.1:2000/words?specific_word=blood

# the browser page goes blank and it hangs (doesnt even have msg at bottom about waiting for 127...

# i am able to check pry though, b/c it didn't close automatically

#       response (for keyword 'blood')

#       => "{\"Search\":[{\"Title\":\"Blood Diamond\",\"Year\":\"2006\",\"imdbID\":\"tt0450259\",\"Type\":\"movie\"},{\"Title\":\"There Will Be Blood\",\"Year\":\"2007\",\"imdbID\":\"tt0469494\",\"Type\":\"movie\"},{\"Title\":\"Harry Potter and the Half-Blood Prince\",\"Year\":\"2009\",\"imdbID\":\"tt0417741\",\"Type\":\"movie\"},{\"Title\":\"True Blood\",\"Year\":\"2008\xE2\x80\x93\",\"imdbID\":\"tt0844441\",\"Type\":\"series\"},{\"Title\":\"First Blood\",\"Year\":\"1982\",\"imdbID\":\"tt0083944\",\"Type\":\"movie\"},{\"Title\":\"Rambo: First Blood Part II\",\"Year\":\"1985\",\"imdbID\":\"tt0089880\",\"Type\":\"movie\"},{\"Title\":\"Blood Simple.\",\"Year\":\"1984\",\"imdbID\":\"tt0086979\",\"Type\":\"movie\"},{\"Title\":\"In the Land of Blood and Honey\",\"Year\":\"2011\",\"imdbID\":\"tt1714209\",\"Type\":\"movie\"},{\"Title\":\"Blood Work\",\"Year\":\"2002\",\"imdbID\":\"tt0309377\",\"Type\":\"movie\"},{\"Title\":\"Throne of Blood\",\"Year\":\"1957\",\"imdbID\":\"tt0050613\",\"Type\":\"movie\"}]}"

#       parsed
#       =>

#   re-check that all my paths are correct

#   check syntax! incuding checking that i'm using the right methods/equations on the correct type/class of variables.


# JUST TO SEE WHAT HAPPENS WHEN I TYPE IN EACH EXAMPLE IN THE BROWSER: 

#       just IP and port

#           i got the main landing page with the search box and example search words
    
#       IP, port and path http://127.0.0.1:2000/words
#             Got this message on the browser: This webpage is not available: 
#             Google Chrome's connection attempt to 127.0.0.1 was rejected. The website may be down, or your network may not be properly configured.

#       IP, port and path http://127.0.0.1:2000/words?specific_word=blood
#             i get the search results for the word 'blood' that is part of this path

#       IP, port and path http://127.0.0.1:2000/fluff (a random word)
#             I got the "You must be lost!" page


# ////////////////////////////////////////////////////////////////////////

# !TO TEST THIS, MAKE SURE YOUR HTML / CSS PATHS ARE CORRECT IN THE CODE!

# Random note: if a key is a string it must be called as a string
# so we might have to remove the .to_sym method in the url method in the homework


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

    return params #we just return the params hash, which b/c of line 22,  
                  # now gives us params[:path] = path, in test case path = "/the forest"
  end

          #the indented steps here are just to prep the 'query_params' hash
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
  # '[:query_params] = query_params' to the main params hash set at line 32 (which already has the path key value pair in it)

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

  client = server.accept #this happens when the client goes to the web page

  request = client.gets 

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
    omdbapi = TCPSocket.new 'www.omdbapi.com', 80 #this is our request to connect to omdapi.com
    omdbapi.puts "GET /?s=#{word}" #this formats and sends the request how omdbapi likes it

    response = omdbapi.gets
    omdbapi.close

    parsed = JSON.parse(response) #this translates omdapi's results into a hash, with the key "Search" and a value of a hsah of movie records

#TIP - always check this result in pry so you are clear on the exact structure that is returned. 

    html = File.read('../Instructors/movie-title-classwork/views/movies.html') #this points to our html file page

    html = html.gsub('{{search_word}}', word)

    movies = []
    
    parsed["Search"].each do |movie|
      individual_movie = File.read('../Instructors/movie-title-classwork/views/individual_movie.html')
    # this means, for all the values in 'parsed["Search"]' which are smaller hashes 'movie' do the following:
      individual_movie = individual_movie.gsub('{{title}}', movie["Title"])
      individual_movie = individual_movie.gsub('{{year}}', movie["Year"])
      individual_movie = individual_movie.gsub('{{imdb_id}}', movie["imdbID"])
      movies.push(individual_movie)
    end

    html = html.gsub('{{movies}}', movies.join(''))
    client.puts(html)
  else
    html = File.read('../Instructors/movie-title-classwork/views/404.html')
    client.puts(html)
  end

# binding.pry

  client.close

end

