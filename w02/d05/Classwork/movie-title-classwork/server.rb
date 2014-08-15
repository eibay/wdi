require 'pry'
require 'json'
require 'socket'
require 'pry'

server = TCPServer.new 2000

# equivalent to while true
def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

  if query_string == nil
    return params
  end

  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end

  params[:query_params] = query_params

  return params
end

loop do

  client = server.accept

  request = client.gets
  path = request.split(" ")[1]
  params = parse_url(path)

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  

  elsif path.split('/')[1] == "words"
    word = path.split('/')[2]

    omdbapi = TCPSocket.new 'www.omdbapi.com', 80
    omdbapi.puts "GET /?s=#{word}"
    response = omdbapi.gets
    omdbapi.close
    parsed = JSON.parse(response)
    
    movies = []

      parsed["Search"].each do |movie|

      movies.push("<li>#{movie["Title"]} (#{movie["Year"]}) - <a href='http://www.imdb.com/title/#{movie["imdbID"]}'>Visit IMDb to learn more</a></li>")
      end
    html = File.read('./views/movies.html')
    html = html.gsub('{{search_word}}', "#{word}")
    html = html.gsub('{{movies}}', movies.join(''))

    client.puts html


  else
    html = File.read('./views/404.html')
    client.puts(html)

  end

  client.close

end