require 'socket'
require 'pry'
require 'json'
require 'uri'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
    puts "Client has connected to our database"



  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)


  elsif path.split("/")[1] == "words"
    movie_search = path.split("/")[2]

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{movie_search}"

    puts "Client has connected to OMDB API and searched for #{movie_search}"

    json_search = omdb_api.gets
    parsed_search = JSON.parse(json_search)
    #parsed search is a hash with 1 array with a bunch of hashes 
    
    search_results = []

    parsed_search["Search"].each do |a|
      search_results << "<li>" + a["Title"] + " (the " + a["Type"] + ') was released in ' + a["Year"] + " You can check out more info " + "<a href='http://www.imdb.com/title/" + a["imdbID"] + "/?ref_=nv_sr_1>here</a></li>"
    end
    
=begin
    parsed_search["Search"].each do |a|
      individual_movie = File.read(individual_movie.html)
      individual_movie = individual_movie.gsub('{{title}}', a["movie"]).gsub('{{year}}', a["year"]).gsub('{{imdb_id}}', a["imdbID"])



      gsub('{{title}}', movie_search)


=end
    replace = search_results.join('')
    search = File.read('./views/search_page.html')
    search = search.gsub('{{everything}}', replace).gsub('{{title}}', movie_search)
    client.puts search

  else
    html = File.read('./views/404.html')
    client.puts(html)
    puts "Client has requested bad path #{path.split("/")}"
  end

  client.close

end