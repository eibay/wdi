# {
#      "artist" => [
#         [ 0] {
#                    "id" => "de6fabd4-35e4-4453-be08-484ae8ba7d3f",
#                  "type" => "Person",
#                 "score" => "100",
#                  "name" => "Elvis",
#             "sort-name" => "Elvis",
#             "life-span" => {
#                 "ended" => nil
#             }
#         },
#         [ 1] {
#                         "id" => "03f1cac5-7179-4588-a94f-f1527e99947b",
#                       "type" => "Group",
#                      "score" => "100",
#                       "name" => "Elvis",
#                  "sort-name" => "Elvis",
#             "disambiguation" => "Experimental Garage Rock from Austin, Texas, US",
#                  "life-span" => {
#                 "ended" => nil
#             }
#         },



require 'pry'
require 'socket'
require 'json'
require 'httparty'

server = TCPServer.new 2000

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
client_ip = client.remote_address.ip_address

puts "#{Time.now} - Client has connected fron #{client_ip}"


request= client.gets.chomp
path = request.split(' ')[1]
puts "#{Time.now} = Client #{client_ip} is attempting to reach #{path}"
params = parse_url(path)

if path == "/"
	html = File.read('./views/index.html')
	clients.puts(html)
elsif path == "/styles.css"
	css = File.read('./stylesheets/styles.css')
	client.puts(css)
elsif path.split("/")[1] == "artist "
	artist_name= path.split("?")[1]
end


response= HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:elvis&fmt=json", headers: {"User-Agent" => "HTTParty"})
response.puts "GET /?query=#{artist}"
# parsed = JSON.parse(response)


the_html = File.read('./views/artists.html')
the_html = html.gsub('{{search_word}}', word)

artist_names= []

response["artist"].each do |x|
artist_names << x["name"]
end
# parsed["artist"].each do |artist|
# 	individual_artist = File.read('./views/individual_artist.html')
# 	individual_movie = individual_movie.gsub('{{year}}', movie["Year"])
# 	individual_movie = individual_movie.gsub('{{imdb_id}}', movie["imdbID"])
# 	movies.push(individual_movie)
# end	
	
	the_html = html.gsub('{{artists}}', artists.join(''))

	client.puts(the_html)
 else
    html = File.read('./views/404.html')
    client.puts(the_ html)
  end

  client.close

end