require 'HTTParty'
require 'socket'
require 'pry'
require 'webrick'

server = TCPServer.new 2000

def parse_url(url)
	path = url.split("?")[0]
	query_string = url.split("?")[1]
	params = {}
	params[:path] = path

	if query_string == nil
		return params
	end

	pairs = query_string.split("&")

	key_values = []

	pairs.each do |pair|
		key_values.push(pair.split("="))
	end

	query_params = {}

	key_values.each do |key_values|
		query_params[key_values[0].to_sym] = key_values[1]
	end

	params[:query_params] = query_params
	return params
end

	loop do

		client = server.accept
		request = client.gets.chomp

		url = request.split(" ")[1]
		params = parse_url(url)

		puts "Requesting #{url}"

		if params[:path] == "/"
			index_html = File.read('./views/index.html')
			client.puts(index_html)

		elsif params[:path] == "/stylesheet/styles.css"
			client.puts File.read('./stylesheet/styles.css')
		elsif params[:path] == "/tag"
			
			tag = []

		tag = params[:query_params][:search]
		instagram_api = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")
		# img_url = instagram_api["data"][0]["images"]["standard_resolution"]["url"]
		instagram_api["data"].each do |x|
		img_url = x["images"]["standard_resolution"]["url"]
		tags.<<"<img src='#{img_url}'>"

		end

		results_html = File.read('./views/results.html')
		results_html = results_html.gsub('{{url}}', tags.join(""))
		results_html = results_html.gsub('{{tags}}', tag)
		client.puts(results_html)

		client.close
		else
			error_html = File.read('./views/404.html')
			client.puts(error_html)
		end
	end