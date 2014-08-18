require 'socket'
require 'pry'
require 'json'
require 'httparty'
load 'parse_url.rb'

server = TCPServer.new 2000

loop do

  client = server.accept
  request = client.gets

  path = request.split(" ")[1]
  params = parse_url(path)

  if params[:path] == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif params[:path] == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif params[:path] == "/artists"
    html = File.read('./views/artists.html')
    query = params[:query_params][:artist]

    mb_response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:'#{query}'&fmt=json")
    # binding.pry

    # mb_response["artist"].each do |x| client.puts x["name"] end
    html = html.gsub('{{query}}', params[:query_params][:artist])
# binding.pry

    artists = []
    mb_response["artist"].each do |x|
      artist_list = File.read('./views/list_artists.html')
      artist_list = artist_list.gsub('{{id}}', x["id"])
      artist_list = artist_list.gsub('{{artist}}', x["name"])
      artists << artist_list
    end
        html = html.gsub('{{artist_result}}', artists.join(' '))
        client.puts (html)
      elsif params[:path] == "/artist"
        # binding.pry

        html = File.read('./views/artist_detail.html')
        # binding.pry
        detail = []
        mb_response["artist"][]
  end


  client.close
end
