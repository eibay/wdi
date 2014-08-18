require 'socket'
require 'json'
require 'pry'
require 'httparty'

server = TCPServer.new 2000

# url = "ws/2/artist/?query=artist:#{artist_name}&fmt=json"

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

while true
  client = server.accept
  request = client.gets 
  url = request.split(" ")[1]
  params = parse_url(url)
  
#connecting with musicbrainz api
if params [:path] == '/'
  html = File.read('./views/index.html')
  client.puts html

######################################################################

#testing

#   response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:Nas&fmt=json", headers: {"User-Agent" => "HTTParty"})

# # binding.pry
#   array_artist_name = []
#     response["artist"].each do |x|
#     array_artist_name<<["name"]
#     client.puts x["name"]
#   end

#   array_artist_country = []
#     response["artist"].each do |x|
#     array_artist_country<<["country"]
#     client.puts x["country"]
#   end

# # disambiguation is artist about me
#   array_artist_about = []
#     response["artist"].each do |x|
#     array_artist_about<<["disambiguation"]
#     client.puts x["disambiguation"]
#   end 
######################################################################

#displaying artists on page
elsif params [:path] == "/artist"
  artist_name = params[:query_params][:specific_artist]
  response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_name}&fmt=json")

  html = File.read('./views/artist.html')
  html = html.gsub('{{search_artist}}', artist_name)

  artist_array = []

  response["artist"].each do |x|
    individual_artist = File.read("./views/individual_artist.html")
    individual_artist = individual_artist.gsub("{{name}}", x["name"].to_s)
    individual_artist = individual_artist.gsub("{{id}}", x["id"].to_s)
    individual_artist = individual_artist.gsub("{{country}}", x["country"].to_s)
    individual_artist = individual_artist.gsub("{{disambiguation}}", x["disambiguation"].to_s)
    artist_array.push(individual_artist)
  end 

#displaying artist_array
  html = html.gsub("{{artist_array}}", artist_array.join(''))
  client.puts html

#error page
else
  html = File.read('./views/error.html')
  client.puts html
  end

client.close
end