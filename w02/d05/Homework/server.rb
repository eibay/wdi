require 'socket'
require 'pry'
require 'json'
require 'httparty'
require 'parse_url'

server = TCPServer.new 2000

loop do

  client = server.accept
  request = client.gets

  path = request.split(" ")[1]
  params = parse_url(path)

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)








  client.close
end
