require 'socket'
require 'pry'
require 'json'

movie_each = []

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
  #binding.pry
    html_index = File.read('./views/index.html')
    client.puts(html_index)
  puts "#{Time.now} - Sent index to #{client_ip}"

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)

  elsif path.split('/')[1] == "words"
    word = path.split("/")[2]

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{word}"
    puts "#{Time.now} - Connecting to OMBD"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} - disconnected from OMDB"

    parsed_response["Search"].each do |x|
      title = x["Title"]
      year = x["Year"]
      imdb_link = x["http://www.imdb.com/title/#{x["imdbID"]}"]
      movie_each << "<li>#{title}<br>#{year}<br>#{imdb_link}</li>"
    end
    word_movie = File.read('./views/word_movie.html')
    word_movie = word_movie.gsub("{{word}}", word)
    word_movie = word_movie.gsub("{{title}}", title)
    word_movie = word_movie.gsub("{{year}}", year)
    word_movie = word_movie.gsub("{{imdb_link}}", imdb_link)


    client.puts(word_movie)
    puts "#{Time.now} - Sent movie info to client #{client_ip}"



  else
    html = File.read('./views/404.html')
    client.puts(html)
  end



  client.close
  puts "#{Time.now} - Client #{client_ip} has disconnected"
end

# Pry(main)> parsed_response["Search"][0]                                    
# {
#      "Title" => "Iron Monkey",
#       "Year" => "1993",
#     "imdbID" => "tt0108148",
#       "Type" => "movie"
# }
