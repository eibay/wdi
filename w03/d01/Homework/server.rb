require 'pry'
require 'httparty'
require 'socket'
require 'httparty'


def convert(str)
	first = str.split("?")
	second = first[1].split("&")
	third = []
	second.each { |item| third << item.split("=") }
	batch = {
		path: first[0][1..-1],
		query_params: {}
	}
	third.each { |arr| batch[:query_params][arr[0].to_sym] = arr[1] }
	return batch
end

server = TCPServer.new 2000

loop do

	client = server.accept
	client_ip = client.remote_address.ip_address
	puts "#{Time.now} - Client #{client_ip} has connected"

	request = client.gets.chomp
	path = request.split(" ")[1]
	puts "#{Time.now} - Client #{client_ip} has requested #{path}"

	query = convert(path) if path.include?("?")


	if path == "/"
		client.puts "#{File.read('views/index.html')}"
		puts "#{Time.now} - sent 'index.html' to Client #{client_ip}"

	elsif path == "/stylesheets/style.css"
		client.puts "#{File.read('stylesheets/style.css')}"
		puts "#{Time.now} - sent 'style.css' to Client #{client_ip}"

	elsif path.split("/")[1] == "assets"
		client.puts File.read("#{path[1..-1]}")
		puts "#{Time.now} - sent '#{path.split("/")[2]}' to Client #{client_ip}"

	elsif query

		if query[:path] == "search"
			response = HTTParty.get("https://api.instagram.com/v1/tags/#{query[:query_params][:tag]}/media/recent?client_id=f36cce4cc31d4041bb2a387d7c015939")
			puts "#{Time.now} -- Instagram has returned search results"
			list = []
			response["data"].each do |hsh|
				list << File.read("views/list_item.html").gsub("{{img}}", hsh["images"]["standard_resolution"]["url"])
				# response["data"][0]["images"]["standard_resolution"]["url"]
			end
			html = File.read("views/yield.html").gsub("{{list}}", list.join(""))
			client.puts html
			puts "#{Time.now} - sent 'yield.html' to Client #{client_ip}"
		end
	else
		client.puts File.read('views/404.html')
	end



	client.close
	puts "#{Time.now} - Client #{client_ip} has disconnected"

end
