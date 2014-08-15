require 'socket'
require 'json'
require 'pry'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  puts "#{Time.now} - Client has connected from #{client}"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "#{Time.now} - Client #{client} is attempting to reach #{path}"

  if path == "/"
    links = []
    trend_words = ['dark', 'dingus', 'truffle', 'hands', 'brooklyn', 'riot', 'weapons', 'anti', 'shark', 'rubber']
    trend_words.each {|w| links.push("<li><a href='/words/#{w}'>#{w}</a></li>")}

    html = File.read('./views/index.html')
    html = html.gsub("{{list}}", links.join(''))
    client.puts(html)
    puts "Sent #{client} index.html"
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
    puts "Sent #{client} style.css"
  elsif path.split("/")[1] == "words"
    word = path.split("/")[2]

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{word}"
  
    puts "#{Time.now} - Connected to OMDB"  
    
    json_response = omdb_api.gets

    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMDB"

    movies = []
    parsed_response["Search"].each do |x|
      movies.push("<li>#{x['Title']}, #{x['Year']}, <a href='http://www.imdb.com/title/#{x['imdb_ID']}'>#{x['Title']} IMDB</a></li>")
    end

    html = File.read('./views/movies.html')
    html = html.gsub("{{word}}", word).gsub('{{movies}}', movies.join(''))
    client.puts html
    
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end