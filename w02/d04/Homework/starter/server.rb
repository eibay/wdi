# Add a new "route" to the server so that it can respond to /words/word. The server should respond
# with an
# html page that displays all of the movies with that word in it's title.
# For each matching movie, you should display it's title, the year it was released, and a link
# to it's IMDB page. You should be able to do all of this with just the information
# returned form the API. The index.html page has three example links. You have succeeded when
# you can clink on one of those links and see a page with a list of movies that have a
#title with the word in it.

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
  path = request.split(" ")[1]
  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"


  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)

    elsif path.split('/')[1] == "words" #&& path.split('/').length == 3
      word = path.split("/")[2]

    # http://127.0.0.1:2000/words/The%20Shawshank%20Redemption = movie_Words var

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80

    omdb_api.puts "GET /?s=#{word}"

    puts "#{Time.now} - Connecting to OMDB"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    parsed["Search"].each do |movie|
    html = File.read('./views/movie_words.html')
    html = html.gsub("{{search_word}}", word.join(""))
    html = html.gsub("{{title}}", movie["Title"])
    html = html.gsub("{{year}}", movie["Year"])
    html = html.gsub("{{imdb_id}}", movie["imdbID"])

    client.puts(html)

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMDB"

  else
    html = File.read('./views/404.html')
    client.puts(html)
  end


  client.close
  puts "#{Time.now} - Client #{client_ip} has disconnected"

end