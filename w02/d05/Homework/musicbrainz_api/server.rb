require 'pry'
require 'json'
require 'socket'
require 'HTTParty'

server = TCPServer.new 2000

# equivalent to while true
def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  puts path, query_string

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

  params[:artist] = query_params[:artist]

  return params
end

loop do

  client = server.accept
  request = client.gets.chomp
  path = request.split(' ')[1]
  params = parse_url(path)

  if params[:path] == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif params[:path] == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif params[:path] == "/artists"
    artist = params[:artist]

    artists = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist}&fmt=json",
      headers: {"User-Agent" => "HTTParty"})["artist"]

    html = "<html><body><ol>"
    artists.each do |artist|
      artist_li = File.read('./views/artists.html')
      artist_li = artist_li.gsub('{{artist_name}}', artist["name"])
      artist_li = artist_li.gsub('{{artist_id}}', artist["id"])
      html += artist_li
    end
    html += "</ol></body></html>"
    client.puts(html)

  elsif params[:path] == "/artist"
    artist = params[:artist]

    info = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{artist}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})

    html = File.read('./views/artist.html')
    html.gsub!("{{artist_name}}", info["name"])
    html.gsub!("{{artist_country}}", info["country"])
    html.gsub!("{{artist_info}}", info["disambiguation"])

    client.puts(html)

  else
    html = File.read('./views/404.html')
    client.puts(html)
    client.puts("Params: #{params.inspect}")
  end

  client.close

end

