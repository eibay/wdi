require 'webrick'
require 'socket'
require 'pry'
require 'HTTParty'

server = TCPServer.new 2000

array_hashtag = []

loop do
  client = server.accept
  request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
  request.parse(client)

if request.path == "/" && request.request_method == "GET"
  html = File.read("./views/index.html")
  client.puts(html)

elsif request.path == "/styles.css"
  css = File.read("./stylesheets/style.css")
  client.puts(css)

elsif request.path =="/tags"
  html = File.read('./views/button.html')
  client.puts html

  search_result = request.query["tag"] 
  response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_result}/media/recent?client_id=3bbdd8399e754e5b8e24bd968905298f
")

  html = html.gsub('{{hashtag_search}}', search_result)

client.puts "<html><body>"

  response["data"].each do |a|
  images = File.read("./views/tags.html")
  images = images.gsub("{{images}}", a["images"]["standard_resolution"]["url"])
  client.puts images
end

client.puts"</body></html>"
#########################################################


elsif request.path == "/" && request.request_method == "POST"
  saved_hashtags = request.body.split("=")[1]
  array_hashtag.push(saved_hashtags)
  client.puts array_hashtag.join(", ")

#########################################################

# elsif request.path == "/save" && request.request_method == "POST"
#   hashtag_array = []

#   saved_hashtags = request.body.split("=")[1]
#   response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_result}/media/recent?client_id=3bbdd8399e754e5b8e24bd968905298f
# ")
#   # binding.pry
#   array_hashtag.push(saved_hashtags)
#   client.puts array_hashtag.join(", ")

#error page
else
  html = File.read("./views/error.html")
  client.puts(html)  

end
  client.close
end