require 'pry'
require 'json'
# require 'socket'
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

#url = "/musicbrainz.org/ws/2/artist/?query=artist:[***ARTIST_NAME***]&fmt=json"
loop do

  client = server.accept

  request = client.gets

  url = request.split(" ")[1]
  params = parse_url(url)

    if params[:path] == "/"
      html = File.read ("./views/index.html")
      client.puts html
    elsif params[:path] == "/artists"
      artist_result = params[:query_params][:artist_name]

  response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_result}&fmt=json", headers: {"User-Agent" => "HTTParty"})
  html = File.read("./views/artists.html")
  html = html.gsub("{{artist_result}}", artist_result)

      artist_list = []

      response.each do |a|
        artist = File.read("./views/artist.html")
        artist = artist.gsub("{{name}}", a["name"])
        artist = artist.gsub("{{id}}", a["id"])
        artist_list.push(artist)
      end

      html = html.gsub("{{artist_list}}", artist_list.join(''))
      client.puts(html)



end

end #end statement for loop do