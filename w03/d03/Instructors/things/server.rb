require 'pry'
require 'socket'
require 'webrick'
require 'httparty'

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

    things_html = []

    things.each do |thing|
      things_html.push("<li><a href='/pictures?tag=#{thing}'>#{thing}</a></li>")
    end

    html = html.gsub("{{things}}", things_html.join(''))
    client.puts(html)
  elsif request.path == "/things" && request.request_method == "GET"
    html = File.read('./views/things.html')
    html = html.gsub("{{things}}", things.join(', '))
    client.puts(html)
  elsif request.path == "/pictures" && request.request_method == "GET"
    tag = request.query_string.split("=")[1]
    instagram_pics = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")
    images = []

    instagram_pics["data"].each do |pic|
      images.push("<img src='#{pic["images"]["standard_resolution"]["url"]}' />")
    end

    html = File.read('./views/pictures.html')
    html = html.gsub("{{pictures}}", images.join(''))
    client.puts(html)
  end

  client.close
end