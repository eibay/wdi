require 'socket'
require 'pry'
require 'JSON'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept
  client_ip = client.remote_address.ip_address

  puts "#{Time.now} - Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(" ")[1]

  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

  
if path.split('/')[1] == "movies"
    movie_title = path.split('/')[2]

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    
    omdb_api.puts "GET /?t=#{movie_title}"

    puts "#{Time.now} - Connecting to OMBD"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMBD"

    client.puts parsed_response
    puts "#{Time.now} - Sent movie info to client #{client_ip}"

    # n = parsed_response

    # n["Search"].each do |x|
    # title = x["Title"]
    # year = x["Year"]
    # imdb = "http://www.imdb.com/title/#{x["imdbID"]}"

  end 

  if path == "/"
    html = File.read('./views/index.html')
    
    html = html.gsub('{{title}}', n["Sample"]["Title"])
    html = html.gsub('{{year_released}}', n["Sample"]["Year"])
    html = html.gsub('{{url}}', n["Sample"]["Poster"])

    

    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end

