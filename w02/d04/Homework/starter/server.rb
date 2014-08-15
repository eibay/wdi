# tested and got 'this webpage is not available when i tried to type in a path'
# also got server.rb:71:in `[]': no implicit conversion of String into Integer (TypeError)
  # from server.rb:71:in `block (2 levels) in <main>'
  # from server.rb:68:in `each'
  # from server.rb:68:in `block in <main>'
  # from server.rb:8:in `loop'
  # from server.rb:8:in `<main>'

require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept
  client_ip = client.remote_address.ip_address

  puts "#{Time.now} - Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

 if path == "/words"
    html = File.read('./views/index.html')
    client.puts(html)
    puts "html sent"

  # don't quite get why we have the content we have on this page.
  # shouldn't it also include a place for them to type the word they want to search with?

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)

  elsif path.split('/')[1] == "words" #checking for the existence of words path, to confirm the route
    
    search_word = path.split('/')[2]

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{search_word}" #we had this is one example today, but not in another
    #I still don't get why we still need it

    puts "#{Time.now} - Connecting to OMBD"

    json_response = omdb_api.gets #Neel says we cld leave chomp off
    puts "api sent"

    parsed_response = JSON.parse(json_response)#Ruby converts the crazy JSON string into a hash

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMBD"


    #what we would give the client if we didn't want to organize the information
        # client.puts parsed_response
        # puts "#{Time.now} - Sent movie info to client #{client_ip}"

    #I know we have to pull the info out of the parsed_response array, 
    #but since i'm hanging when connecting to OMDB, I can't get a visual of
    #the data structure that the response comes back in. I'm guessing it's an array with hashes, 
    #since 1 movie result comes in hash form
    #i tried 12 Angry Men b/c it was made twice, but a direct OMDB search only returned one of them

    # not really sure what to call the individual arrays - movie_entries?
    #do we have to initialize movie_entry? oh, we do in the .each


    html = File.read('./views/search_word_detail.html')
     
    html = html.gsub("{{search-word}}", search_word)

    parsed_response.each do|movie_entry|
    #assuming my parsed_response is the same thing as the "Search" hash from the results of the page

    title = movie_entry["Title"]
    html = html.gsub("{{title}}", title)
    year = movie_entry["Year"]
    html = html.gsub("{{year}}", year)
    imdb = "http://www.imdb.com/title/#{x["imdbID"]}"
    #how i got - put the imdb id in imdb search and saw the path of the movie that came up
    html = html.gsub("{{imdb_id}}", imdb)
    
    client.puts html
#BIG QUESTION = HOW TO MAKE SURE THIS CREATES NEW ENTRIES USING THE HTML FORMAT?
     
     puts "#{Time.now} - Sent movie info to client #{client_ip}"

    end

  else
    html = File.read('./views/404.html')
    client.puts(html)
  
  end

  client.close
  puts "#{Time.now} - Client #{client_ip} has disconnected"

end


 
















