require 'pry'
require 'socket'
require 'webrick'

server = TCPServer.new 2000

things = []

loop do
  client = server.accept

  request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
  request.parse(client)

  if request.path == "/" && request.request_method == "GET"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif request.path == "/things" && request.request_method == "POST"
    thing = request.body.split("=")[1]
    things.push(thing)

    html = File.read('./views/things.html')
    html = html.gsub("{{things}}", things.join(', '))
    client.puts(html)
  elsif request.path == "/things" && request.request_method == "GET"
    html = File.read('./views/things.html')
    html = html.gsub("{{things}}", things.join(', '))
    client.puts(html)
  end

  client.close
end