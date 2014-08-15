require 'json'
require 'socket'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]

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
    parsed = JSON.parse(response)

    static_html = File.read("./views/static.html")
    static_html = static_html.gsub('{{SEARCH_WORD}}', "#{word}")


    hello = []
    hello << static_html
    parsed["Search"].each do |movie|
      html = File.read('./views/movies.html')
      html = html.gsub('{{title}}', movie["Title"])
      html = html.gsub('{{year}}', movie["Year"])
      html = html.gsub('{{imdb_id}}', movie["imdbID"])
#       html = html.gsub('<!DOCTYPE html>
# <html lang="en">
# <head>
#   <meta charset="UTF-8">
#   <link rel="stylesheet" type="text/css" href="/styles.css">
#   <title></title>
# </head>
# <body>', "")
#       html = html.gsub('</body>
# </html>', "")
      hello << html
    end
    
    client.puts hello




  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end