#!/usr/bin/env ruby  

require 'httparty'
require 'socket'
require 'erb'

html = <<THE_HTML_VIEW
<!DOCTYPE html>
<html lang=en>
<head>
	<meta chaset=utf-8>
	<title> You searched for a <%= $search %>... </title>
	<style>
		body {
			background-color: white; 
		}

		h1 {
			color: white;
			text-align: center;
			font-size: 3em;
			padding: 0;
			margin: 0;
		}

		h1 span {
			color: red;
		}

		section {
			border-radius: 25px; 
			padding-top: .75em;
			padding-bottom: .75em; 
			width: 60%;
			background-color: black;
			margin: auto;
		}

		img {
			display: block;
			width: 90%;
			margin: auto;
			padding-bottom: 2.5em;
		}

		p {
			text-align: center; 
			color: white;
			font-size: 3em;
			width: 90%;
			margin: auto;
			margin-top: -.45em;
		}

	</style>
</head>
<body>
	<section> 
		<h1> You searched for a <span><%= $search %></span> </h1>
		<% $recent_media.each do |photo| %>
			<img src=<%= photo %> >
		<% end %>
		<p> Those were them. </p>
	</section>
</body>
</html>
THE_HTML_VIEW


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
	e = ERB.new which  
	e.result binding 
end 

$search = ARGV.last 
if ARGV.last.nil? 
	abort "USAGE: pictures TAG_SEARCH_TERM" 
else 
	$recent_media = get_recent_media $search 
	$recent_media = get_standard_images $recent_media

	s = TCPServer.new port 
	puts "Get yr browser out & go to localhost:#{port}"
	c = s.accept 
	r = c.gets 

	v = send_view html 
	c.puts v 
	c.close 
end  