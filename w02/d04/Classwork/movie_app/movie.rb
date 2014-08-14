require 'socket'
require 'pry'
require 'json'
require 'rainbow/ext/string'
server=TCPServer.new 2000

while true
	client=server.accept
	client_ip= client.remote_address.ip_address
	puts "#{Time.now} has connected from #{client_ip}".color(:red)

	request=client.gets.chomp
	path=request.split(" ")[1]
	puts path
	puts "#{Time.now}: Client #{client_ip} is attempting to connect from #{path}".color(:green)

		if(path=="/movies/views/style.css")
			client.puts File.read("./views/style.css")
			
		elsif(path.split("/").length==3)&&(path.split("/")[1]=="movies")

			    movie=path.split("/")[2]
			api=TCPSocket.new 'www.omdbapi.com', 80
			api.puts "GET /?&t=#{movie}&tomatoes=true"

			puts"#{Time.now} :Connecting to OMDB".color(:magenta)

			response=api.gets
			response=JSON.parse(response)
			api.close
			puts "#{Time.now}: Disconnected from OMDB".color(:cyan)
			if(response["Response"]=="True")
			html_file=File.read("./views/movie.html")
			replacements = [["{{movie}}", response["Title"]], ["{{poster}}", response["Poster"]] , ["{{released}}" , response["Released"]] , ["{{imdb}}" , response["imdbRating"]] , ["{{rotten}}" , response["tomatoMeter"]] , ["{{style}}" ,   "<link rel='stylesheet' type='text/css' href='./views/style.css'>"] , ["{{Director}}" , response["Director"]] ,  ["{{box_office}}" , response["BoxOffice"]] , ["{{imdb_link}}" , response["imdbID"]] , ["{{metascore}}" , response["Metascore"]]] 
    		replacements.each  {|replacement| html_file.gsub!(replacement[0], replacement[1])} 
			client.puts html_file
			else
				client.puts "That is not a movie"
			end

		







	end






	puts "#{Time.now}: Client #{client_ip} has disconnected".color(:blue)
	client.close


end
