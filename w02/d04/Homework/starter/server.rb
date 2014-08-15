require 'socket'
require 'json'
require 'pry'

server = TCPServer.new 2000
movienames = []
words1 = ["friend", "monkey", "true", "hope"]
words2 = []

# equivalent to while true
loop do

  client = server.accept
  puts "client connected"

  request = client.gets
  path = request.split(" ")[1]
  path1 = path.split("/")
  puts "Attempting to reach path"

  if path == "/words"
    words1.each do |x|
      words2 << "<li><a href='/words/#{x}'>#{x}</li>"
    end

    html = File.read('./views/index.html')
    html = html.gsub("{{words2}}", words2.join(''))
    client.puts(html)
    puts "path reached and html sent"
  elsif path1[1] == "words" && path1.length == 3
    searchword = path1[2]
    api = TCPSocket.new "www.omdbapi.com", 80
    api.puts "GET /?s=#{searchword}"
    puts "connecting to omdb"
    response = api.gets
    puts "api sent"
    responsejson = JSON.parse(response)
    api.close
    puts "disconnected from ombd"
      responsejson["Search"].each do|x|
        title = x["Title"]
        year = x["Year"]
        imdb = "http://www.imdb.com/title/#{x["imdbID"]}"
        movienames << "<li>#{title} made in #{year} and imbd link of <a href = '#{imdb}'>IMDB</a></li>"
      end
    html = File.read('./views/index1.html')
    html = html.gsub("{{Searchword}}", searchword)
    html = html.gsub("{{movie_name}}", movienames.join(''))
    client.puts html
    puts "path 2 reached and html sent"
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
    puts "stylesheet sent"
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end
  client.close
end

  
