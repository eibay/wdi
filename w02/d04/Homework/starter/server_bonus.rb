require 'socket'
require 'pry'
require 'json'


server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]

  if path == "/"
    trending_words_api = TCPSocket.new 'https://api.twitter.com/1.1/trends/place.json', 80
    trending_words_api.puts "GET https://api.twitter.com/1.1/trends/place.json?id=1"
    trending_words_output = trending_words_api.gets

    #if trending_words actually retreived data
    parsed_trending = JSON.parse(trending_words_output)
    
    trending_search=[]

    #would have to unpeel array (0)/ hash "trends" pointing to array of hashes
    
    parsed_trending[0]["trends"].each do |b|
      trending_search << "<li>" + b["name"] + "</li>"
    end
    trending_search_joined = trending_search,join('')
    html = File.read('./views/index_bonus.html')
    html = html.gsub('{{search}}', trending_search_joined)

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