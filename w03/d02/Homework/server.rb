require 'webrick'
require 'socket'
require 'pry'
require "httparty"

server = TCPServer.new 2000
array = []
search_keepers = []

loop do

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" 
		html = File.read("./views/index.html")
		client.puts html
	elsif request.path == "/tag" && request.request_method == "GET"
		search_word = request.query["search_word"] #may need to move this
		html = File.read('./views/images.html')

    	instagram_images = HTTParty.get("https://api.instagram.com/v1/tags/#{search_word}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})

    	instagram_images["data"].each do |image|
      		array.push "<img src='" + image['images']['low_resolution']['url'] + "'/>"
    	end

    	fat_string = array.join('')

    	image_page = html.gsub('{{search_word}}', search_word)
    	final_page = image_page.gsub('{{image}}', fat_string)

    	client.puts(final_page)


		# binding.pry
		# client.puts search_keepers.join(", ")

    	# if button is clicked on

	elsif request.path == "/tag" && request.request_method == "POST"

		search_word = request.query["search_word"] #this needs to be NOT QUERY ---MAYBE request.body["search_word"]
		search_keepers.push(search_word)

	end

	client.close
end


