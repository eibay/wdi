require 'pry'
require 'socket'
require 'webrick'
require 'httparty'

server = TCPServer.new 2000

saved_tags = []
saved_images = []




loop do

client = server.accept
puts "#{Time.now} - Client has connected"

request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
request.parse(client)
puts "#{Time.now} - Client has made request"


if request.request_method == "GET"

	if request.path == "/"
		html = File.read("./views/index.html")
		client.puts html

	elsif request.path == "/stylesheets/style.css"
		css = File.read("stylesheets/style.css")
		client.puts css
		puts "#{Time.now} - Sent 'style.css' to Client"

	elsif request.path == "/saved_tags"
		list = []
		saved_tags.each do |tag|
			l_i = File.read("./views/tag_li.html").gsub("{{l_i}}", tag)
			list << l_i
		end
		html = File.read("./views/saved_tags.html").gsub("{{list}}", list.join("\n"))
		client.puts html

	elsif request.path == "/saved_images"
		list = []
		saved_images.each do |url|
			l_i = File.read("./views/image_li.html").gsub("{{l_i}}", url)
			list << l_i
		end
		html = File.read("./views/saved_images.html").gsub("{{list}}", list.join("\n"))
		client.puts html

	elsif request.query_string
		get_req = HTTParty.get("https://api.instagram.com/v1/tags/#{request.query["tag"]}/media/recent?client_id=f36cce4cc31d4041bb2a387d7c015939")
		image_urls = []
		get_req["data"].each do |hash|
			image_urls << hash["images"]["standard_resolution"]["url"]
		end
		list = []
		image_urls.each do |url|
			l_i = File.read("views/list_item.html")
			l_i = l_i.gsub("{{li_active}}", "disabled") if saved_images.include?(url)
			l_i = l_i.gsub("{{l_i}}", url)
			list << l_i
		end
		html = File.read("./views/image_results.html").gsub("{{list}}", list.join("\n"))
		html = html.gsub("{{tag}}", request.query["tag"])
		html = html.gsub("{{tag_active}}", "disabled") if saved_tags.include?(request.query["tag"])
		client.puts html
	end



elsif request.request_method == "POST"
	if request.path == "/save_image"
		saved_images << request.query["url"]
		html = File.read("views/image_was_saved.html")
		client.puts html

	elsif request.path == "/save_tag"
		saved_tags << request.query["tag"]
		html = File.read("views/tag_was_saved.html")
		client.puts html
	end

end



client.close
puts "#{Time.now} - Disconnected from Client"

end
