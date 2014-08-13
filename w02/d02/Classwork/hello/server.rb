require 'socket'
require 'pry'
require 'URI'

server = TCPServer.new 2000

while true
	client = server.accept
	request = client.gets.chomp
	path = request.split[1]
	# param = URI.decode(path.split("/")[2])
	time_now = Time.now.strftime(" %I:%M%p")
	# acceptablenames = ['monkey', 'jeff', 'severus', 'peter parker']

	people = {
		"monkey" => {
			location:  "tree",
			flavor:  "banana"
		},

		"severus" => {
			location:  "wizard death place with Dumbledore",
			flavor: "coffee"
		},

		"peter parker" => {
			location:  "Forest Hills",
			flavor: "fly"	
		}
	}  
# binding.pry

	if path == "/"
		client.puts "<h1>THIS IS ME YELLING! j/k...#{time_now}</h1>"
		puts "Serving the index page."

	elsif path == "/hello"
		
		client.puts "<h1>Yo whaddap...</h1>"
		puts "Serving the hello page."
		param = URI.decode(path.split("/")[2])
    elsif path == "/hello/#{param}" && people.keys.include?[param] #&& param != nil

    	client.puts "<h1>Hello, #{param}</h1>"

    	if param == "severus"
    		client.puts "<h1>Secret Slytherin Message</h1>"
    	end
    	puts "Serving the #{param} page."

    elsif path == "/hello/#{param}" && !people.keys.include?[param] #&& param != nil
    	client.puts "<h1><span style='color: red;'>Sorry, we do not know you like dat.</span></h1>"
	end

	client.close
end