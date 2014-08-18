require 'socket'
require 'json'
require 'pry'

server = TCPServer.new 2000
movienames = []

# equivalent to while true
loop do

  client = server.accept
  puts "client connected"

  request = client.gets.chomp
  path = request.split(" ")[1]
  path1 = path.split("/")

  if path == "/words"
    html = File.read('./views/index.html')
    client.puts(html)
    puts "html sent"
  elsif path1[1] == "words" && path1.length == 3
    searchword = path1[2]
    api = TCPSocket.new "www.omdbapi.com", 80
    api.puts "GET /?s=#{searchword}"
    response = api.gets
    puts "api sent"
    responsejson = JSON.parse(response)
    api.close
 
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
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end
  client.close
end