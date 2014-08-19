require 'pry'
require 'socket'
require 'httparty'
require 'uri'

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

loop do

  client = server.accept
  
  request = client.gets
  url = request.split(" ")[1]
  params = parse_url(url)
  
  
  if params[:path] == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  
  elsif params[:path] == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  
  elsif params[:path] == "/artist"
    artist = params[:query_params][:artist]
    musicbrainz_results = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist}&fmt=json")
    returned_artists = []
    musicbrainz_results["artist"].each do |result|
    returned_artists << result["name"]
    end

    artist_lis = []
    returned_artists.each do |artist_name|
      individual_artist = File.read('./views/individual_artists.html')
      individual_artist = individual_artist.gsub('{{artist}}', artist_name)
      artist_lis << (individual_artist)
    end

    results_page = File.read('./views/artists.html')
    results_page = results_page.gsub('{{artist}}', artist.capitalize).gsub('{{artist_lis}}', artist_lis.join(''))

    client.puts(results_page)
  
  elsif params[:path] == "/artistpage"
    specific_artist = params[:query_params][:artist]

    musicbrainz_results["artist"].each do |result|
      if result["name"] == specific_artist
      artist_id = result["id"]
      end
    end
    musicbrainz_specific_artist = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{artist_id}?inc=aliases&fmt=json")
    artist_details = {}
    artist_details[]


  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end