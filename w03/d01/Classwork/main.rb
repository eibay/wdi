require 'socket'
require 'httparty'
require 'pry'


# server=TCPServer.new 2000

	# client=server.accept
	# response=client.gets
	puts "What tag would you like to evaluate?"
	tag= gets.chomp

	the_tag=HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
# someone_elsie["data"].each do |n|
puts the_tag["data"][0]["link"]
puts the_tag["data"][0]["images"]["standard_resolution"]["url"]
# end
# 	client.close



