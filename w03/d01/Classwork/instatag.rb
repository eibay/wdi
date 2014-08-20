require 'socket'
require 'HTTParty'
require 'pry'

server = TCPServer.new 2000

loop do
  client = server.accept

  client.puts "Enter a tag to lookup!: "
  response = client.gets.chomp
  tag = HTTParty.get("https://api.instagram.com/v1/tags/#{response}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")
# binding.pry

  result = tag["data"].each do |pic|
    client.puts pic["link"]
  end
## instagram_things["data"][0]["link"]


    client.close
end
