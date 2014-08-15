require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept
  client_ip = client.remote_address.ip_address

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

  movie_names = []

  if path == "/"
    html = File.read('./starter/views/index.html')
    client.puts(html)

    puts "#{Time.now} - Sent index.html to #{client_ip}"

  elsif path.split("/")[1] == "words"
    word = path.split("/")[2]
   
    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{word}"
   
    puts "#{Time.now} - Connecting to OMDB"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    parsed_response["Search"].each do |x|
    title = x["Title"]
    year = x["Year"]
    imdb = "http://www.imdb.com/title/#{x["imdbID"]}"
    movie_names << "<li><em><a href='#{imdb}'>#{title}</a> -- #{year}</li>"
    end
      omdb_api.close
      puts "#{Time.now} - Disconnected from OMDB"

    words_html = File.read('./starter/views/words.html')
    words_html = words_html.gsub("{{search_term}}", word)
    words_html = words_html.gsub("{{movie_titles}}", movie_names.join(''))

    client.puts words_html
    puts "#{Time.now} - Sent movie information to #{client_ip}"

  elsif path == "/styles.css"
    css = File.read('./starter/stylesheets/styles.css')
    client.puts(css)

  else
    html = File.read('./starter/views/404.html')
    client.puts(html)
  end

  client.close
  puts "#{Time.now} - Disconnected from server"
end

  