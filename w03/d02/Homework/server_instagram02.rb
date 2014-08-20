require 'webrick'
require 'httparty'
require 'pry'

server = TCPServer.new 2000
favorites = []

loop do
  client = server.accept

  request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
  request.parse(client)


  if request.path == "/"
    html = File.read("./views/index.html")
    client.puts html
  elsif request.path == "/tags"
    search_result = request.query["category_name"]
    #binding.pry
    response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_result}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

  image_str = ""

  response["data"].each do |a|
     #binding.pry
    images = File.read("./views/images.html")

     images = images.gsub("{{images}}", a["images"]["standard_resolution"]["url"])

     image_str += images

  end # ends each block

  image_html = File.read("./views/tags.html")

  image_html = image_html.gsub("{{images02}}", image_str)

  image_html = image_html.gsub("{{stuff}}", search_result)
  client.puts image_html

elsif request.path == "/favorites.html"
  favorites_html = File.read("./views/favorites.html")
  # favorites_html = favorites_html.gsub("{{images03}}", search_result)
  client.puts favorites_html


  end #ends if conditional statement

  client.close

end #ends loop statement
