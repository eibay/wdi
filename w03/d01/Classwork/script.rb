#!/usr/bin/env ruby  

require 'httparty'
require 'socket'
require 'erb'

$access_token = "4ad7cc36c172434588afd340aa74cd01"
port = 2000 

def get_recent_media tag
	url = "https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{$access_token}"
	HTTParty.get url 
end 
 
  
def get_standard_images results
	hash = results["data"]
	hash.map do |images|
		images["images"]["standard_resolution"]["url"]
	end  
end 

def send_view which 
	path = "./views/#{which}/index.html.erb"
	f = File.read path 
	e = ERB.new f 
	e.result binding 
end 

$search = ARGV.last 
if ARGV.last.nil? 
	abort "USAGE: pictures TAG_SEARCH_TERM" 
else 

	$recent_media = get_recent_media $search 
	$recent_media = get_standard_images $recent_media

	s = TCPServer.new "#{port}" 
	puts "Get yr browser out & go to localhost:#{port}"
	loop do 
		c = s.accept 
		r = c.gets 

		v = send_view "photos" 
		c.puts v 
		c.close 
	end
end  