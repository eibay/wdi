require 'socket'
require 'pry'
require 'httparty'

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

		key_values.each do |key_value|
			query_params[key_value[0].to_sym] = key_value[1]
		end
params[:query_params] = query_params
return params

end


loop do 

client = server.accept
client_ip = client.remote_address.ip_address
request = client.gets

puts "Client has connected from #{client_ip}"

	url = request.split(" ")[1] 
	params = parse_url(url) 
 	
 	puts "Requesting #{url}"

	if params[:path] == "/"
		index_html = File.read('./views/index.html')
		
		client.puts(index_html)

	elsif params[:path] == "/stylesheets/styles.css"
	client.puts File.read('./stylesheets/styles.css')

	# elsif params[:path] == "/images/instagram.jpg"
	# client.puts File.read('./images/instagram.jpg')

	elsif params[:path] == "/images/polaroid.jpg"
	client.puts File.read('./images/polaroid.jpg')

	elsif params[:path] == "/tag"
	tags = []

	tag = params[:query_params][:search].capitalize
	
	instagram_api = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")
	# img_url = instagram_api["data"][0]["images"]["standard_resolution"]["url"] 
	
	instagram_api["data"].each do |x|
			img_url = x["images"]["standard_resolution"]["url"]
			tags << "<a href='#{img_url}'><img src='#{img_url}'></a>"
		end

		results_html = File.read('./views/results.html')
		results_html = results_html.gsub('{{url}}', tags.join(''))
		results_html = results_html.gsub('{{tags}}', tag)
		results_html = results_html.gsub("{{tags}}", tag || "Not found")
		client.puts(results_html)

	else 
		error_html = File.read('./views/404.html')
		client.puts(error_html)
	end
	client.close
	
end
