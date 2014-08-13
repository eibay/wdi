require 'socket'
require 'pry'
require 'uri'
server = TCPServer.new 2000


people = {
  "monkey" => {
    location: "tree",
    flavor: "banana"
  },
  "severus" => {
    location: "wizard death place with dumbledore",
    flavor: "coffee"
  },
  "peter parker" => {
    location: "Forest Hills",
    flavor: "fly"
  }
}


while true
	
	client = server.accept
	
	request = client.gets.chomp
	path = request.split(" ")[1]
	
		if path == "/"
			#time = Time.new
			# hour = Time.now.hour
			# minute = Time.now.min

			t = Time.now
			time = t.strftime("%I:%M %p")
			client.puts "<h1>Index #{time}</h1>"

		elsif path == "/hello"
			client.puts "<h1>HELLO</h1>"

		
		elsif path.split("/")[1] == "hello" && path.split("/").length == 3 # == "monkey" || path.split("/")[2] == "jeff" || path.split("/")[2] == "severus" 
			name = URI.decode(path.split("/")[2])
			
			if people.keys.include?(name)
				html ="<head><link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'></head><body><h1 style= 'font-family: Audiowide, cursive;'>Hello, #{name.capitalize}</h1></body>"
				html += "<head><link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'></head><body><p style= 'font-family: Audiowide, cursive;'><p> Who lives in #{people[name][:location]}</p></body>"
				html += "<head><link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'></head><body><p style= 'font-family: Audiowide, cursive;'><p> Mmmm I have some #{people[name][:flavor]} icecream for you </p></body>"
				client.puts html

			else
				client.puts "We don't know you"
			end


		else
			name = path.split("/")[2]
			client.puts "<h1>I don't know #{name}</h1>"

		end


	client.close

end