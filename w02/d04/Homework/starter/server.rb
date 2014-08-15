require 'socket'
require 'json'
require 'uri'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  client_ip = client.remote_address.ip_address
  puts "#{Time.now} - client connected"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "#{Time.now} - client #{client_ip} is attempting to reach #{path}"


  if path == "/"
    html = File.read('./views/index.html')
    client.puts html

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  
  
  elsif path == "/words/friend"


    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=friend"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} disconnecting from OMDB"

    movies = []

    parsed_response["Search"].each do |n|
      url = 'http://www.imdb.com/title/'
      url = url + n["imdbID"]
      link = "<a href='#{url}'>"
      
      movies.push("<li>#{n["Title"]} was released in #{n["Year"]}. Visit #{link}IMDb</a> to learn more.</li>")
    
    end

    html = File.read('./views/movie.html')
    html = html.gsub('{{word}}', "Friend")
    html = html.gsub('{{movies}}', movies.join(''))
    client.puts html


  elsif path == "/words/true"

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=true"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} disconnecting from OMDB"

    movies = []

    parsed_response["Search"].each do |n|
      url = 'http://www.imdb.com/title/'
      url = url + n["imdbID"]
      link = "<a href='#{url}'>"
      
      movies.push("<li>#{n["Title"]} was released in #{n["Year"]}. Visit #{link}IMDb</a> to learn more.</li>")
    
    end

    html = File.read('./views/movie.html')
    html = html.gsub('{{word}}', "True")
    html = html.gsub('{{movies}}', movies.join(''))
    client.puts html




  elsif path == "/words/monkey"

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=monkey"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} disconnecting from OMDB"

    movies = []

    parsed_response["Search"].each do |n|
      url = 'http://www.imdb.com/title/'
      url = url + n["imdbID"]
      link = "<a href='#{url}'>"
      
      movies.push("<li>#{n["Title"]} was released in #{n["Year"]}. Visit #{link}IMDb</a> to learn more.</li>")
    
    end

    html = File.read('./views/movie.html')
    html = html.gsub('{{word}}', "Monkey")
    html = html.gsub('{{movies}}', movies.join(''))
    client.puts html

  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close
  puts "#{Time.now} - client #{client_ip} has disconnected"

end