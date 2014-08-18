require 'pry'
require 'socket'
require 'json'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]
  terms = path.split("/")

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)

  elsif terms[1] == "words" && terms.length == 3
    omdbapi = TCPSocket.new('www.omdbapi.com', 80)

    omdbapi.puts "GET /?s=#{terms[2]}"
    response = omdbapi.gets.chomp
    parsed_resp = JSON.parse(response)

    list = []

    parsed_resp["Search"].each do |hit|
      if hit["Type"] == "movie"
        list << "<li><a href='http://www.imdb.com/title/#{hit["imdbID"]}'>#{hit["Title"]}</a> was released in #{hit["Year"]}.</li>"
        # list << "<li>#{hit["Title"]} was released in #{hit["Year"]}.</li>"
      end
    end

    html = File.read("./views/movie.html")
    html = html.gsub("{{list}}", list.join("\n"))
    html = html.gsub("{{word}}", terms[2].downcase.capitalize)

    client.puts html

    omdbapi.close

    else
    html = File.read('./views/404.html')
    client.puts(html)



  end

  client.close
  # binding.pry

end