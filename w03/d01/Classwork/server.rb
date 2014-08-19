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

	pairs = query_string.split("&")[0]
	pair = pairs.split("=")

	query_params = {}
	pair.each do |key_value|                                        
	   query_params[pair[0]] = pair[1]                               
	end  
  	params[:query_params] = query_params

  return params
end
loop do

	client = server.accept
	request = client.gets
	path = request.split(" ")[1]
	params = parse_url(path)


	if  params[:path] == '/'
		html = File.read('./index.html')
		client.puts(html)
		puts("html sent")

	elsif params[:path] == "/tags"
		path1 = parse_url(path)
		puts path1
		tag = path1[:query_params]["tag"]
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=f487e0636e6e44c396a32f49390219fe", headers: {"User-Agent" => "Httparty"})

		data_array = []
		response["data"].each do |a|
			data_array.push a["images"]
		end

		url_array =[]
		data_array.each do |b|
			url_array.push "<img src='" + b["low_resolution"]["url"] + "' alt =''>"
		end

		url_array2 = url_array.join('').to_s
		tagshtml = File.read('./tags.html')
		tagshtml = tagshtml.gsub('{{image}}', url_array2 )
		tagshtml = tagshtml.gsub('{{tag}}', tag)
		client.puts tagshtml

	elsif path == '/stylesheet/style.css'
		css = File.read('./stylesheet/style.css')
		client.puts css

	end
	client.close
end


