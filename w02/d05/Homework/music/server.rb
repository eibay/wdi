require 'httparty'
require 'json'
require 'socket'
require 'pry'

server = TCPServer.new 2000

# url = "/the_forest?animal=monkeys&food=bananas"
# url = "/ws/2/artist/?query=artist:[***ARTIST_NAME***]&fmt=json"

# def parse_url(url)
#   path = url.split("?")[0]
#   query_string = url.split("?")[1]

#   params = {}
#   params[:path] = path

#   if query_string == nil
#     return params
#   end

#   pairs = query_string.split("&")

#   key_values = []

#   pairs.each do |pair|
#     key_values.push(pair.split("="))
#   end

#   query_params = {}

#   key_values.each do |key_value|
#     query_params[key_value[0].to_sym] = key_value[1]
#   end

#   params[:query_params] = query_params

#   return params
# end

# equivalent to while true
loop do

  client = server.accept

  request = client.gets
  url = request.split(" ")[1]
  params = "/"

  if params == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif params == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif params == "/words"
    word = [artists_name]
    response_1 = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{word}&fmt=json", headers: {"User-Agent" => "Httparty"})

    html = File.read('./views/music.html')
    html = html.gsub('{{artists_name}}', word)
    # http://musicbrainz.org/ws/2/artist/[***ARTIST_ID_FROM_MUSICBRAINZ***]?inc=aliases&fmt=json

  
    response_1["artist"].each do |artist|
      puts artist["name"]
    end


    # artists = []

    # response_1["artist"].each do |artist|
    #   artists.push(artist["name"])
    # end

    # puts artists

  elsif params == "words?artist_name={{artists_name}}"

  response_1["artist"].each do |artist|
    if artist["name"] == {{artists_name}}
      puts artist["name"]
      puts "is from"
      puts artist["area"]["name"]
    end

  end



# http://127.0.0.1:2000/words?artist_name=artists_hame
 

  end

  client.close

end