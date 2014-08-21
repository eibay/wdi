require 'socket'
require 'webrick'
require 'httparty'
require 'uri'
require 'rainbow/ext/string'
require 'pry'

puts "#{Time.now} - Server started...\n".color(:yellow)

server = TCPServer.new 2000

saved_tags = []
saved_images = []

loop do
	client = server.accept
  client_ip = client.remote_address.ip_address

  puts "#{Time.now} - Client has connected from #{client_ip} \n".color(:blue)

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)
	
  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{request.path} \n".color(:green)

  if request.path == '/' && request.request_method == "GET"
  	html = File.read("views/index.html")
  	client.puts html
  elsif request.path == '/images' && request.request_method == "GET"

  	api_result = HTTParty.get("https://api.instagram.com/v1/tags/#{request.query["tag"]}/media/recent?client_id=267f9747893548ab86d79baff64cb209")

  	puts "#{Time.now} - API call to Instagram has been completed \n".color(:magenta)
		
		images = api_result['data'].map do |i| 
			image = i['images']['standard_resolution']['url']
			image_string = "<img src='#{image}'>
											 <form action='/saved/images' method='POST'>
											 <input type='hidden' name='image' value='#{image}'>
											 <input type='submit' value='Save Image'></form><br>"	
		end

		html = File.read("./views/images.html")
		html = html.gsub("{{images}}", images.join(''))
		html = html.gsub("{{tag}}", request.query["tag"])
		client.puts html

		puts "#{Time.now} - Sent images.html to client #{client_ip} \n".color(:red)

	elsif request.path == "/saved/tags" && request.request_method == "POST"
			tag = request.body.split('=')[1]
			unless saved_tags.include?("<li><a href='/images?tag=#{tag}'>#{tag}</a></li>")
				saved_tags.push("<li><a href='/images?tag=#{tag}'>#{tag}</a></li>")
			end
			
			html = File.read("./views/saved_tags.html")
			html = html.gsub("{{saved_tags}}", saved_tags.join(''))
			client.puts html	

			puts "#{Time.now} - Sent saved_tags.html to client #{client_ip} \n".color(:red)
					
	elsif request.path == "/saved/images" && request.request_method == "POST"
		image = URI.decode(request.body.split('=')[1])
		unless saved_images.include?("<li><img src='#{image}'></li>")
			saved_images.push("<li><img src='#{image}'></li>")
		end
		binding.pry
		html = File.read("./views/saved_images.html")
		html = html.gsub("{{saved_images}}", saved_images.join(''))
		client.puts html

		puts "#{Time.now} - Sent saved_images.html to client #{client_ip} \n".color(:red)
  end	

	client.close
	puts "#{Time.now} - Disconnecting from client #{client_ip} \n".color(:blue)

end

