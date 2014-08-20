require 'socket'
require 'webrick'
require 'pry'

server = TCPServer.new 2000

things = []
stuff = []

loop do
  client = server.accept
  request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
  request.parse(client)

  if request.path == "/"
    html = File.read('./views/index.html')
    client.puts html

  elsif request.path == "/things" && request.request_method == "POST"

    things << request.query["fav_thing"]

    things.each do |x|
      thing = File.read('./views/fav_thing.html')
      stuff << x
      thing = thing.gsub('{{thing}}', stuff)
    end

    thing = File.read('./views/fav_thing.html')

    # thing = thing.gsub('{{thing}}', stuff)
    html = File.read('./views/things.html')
    html = html.gsub('{{things}}', thing)#stuff.join(" "))
    # binding.pry
    client.puts html

elsif request.path == "/things" && request.request_method == "GET"
    # binding.pry
    thing = File.read('./views/fav_thing.html')
    thing = thing.gsub('{{thing}}', stuff)
    html = File.read('./views/things.html')
    html = html.gsub('{{things}}', stuff.join(" "))
    client.puts html
  end

  client.close
end
