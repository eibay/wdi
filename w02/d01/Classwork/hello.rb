# require 'socket'

# server = TCPServer.new 2000

# # / -> Indiex h1

# # /hello ->Hello! h1


# while true

# 	#connect
# 	client = server.accept

# 	#listen - get input
# 	request = client.gets.chomp
# 	banana = request.split (' ')[1]
# 	puts "client said: #{request}"


# 	#talk
# 	#in one case
# 	if path ==
	
# 	If request == "GET/hello HTTP/1.1"
# 	client.puts "<h1>HELLO!</h1>"


# 	#in another case
# elsif request == "GET / HTTP/1.1"
		
# 	client.puts "<h1>index</h1>"

# end
# 	client.close

# end


# require 'socket'

# server = TCPServer.new 2000

# # / -> Index h1
# # /hello -> Hello! h1

# while true
# 	client = server.accept

# 	request = client.gets.chomp
# 	path = request.split(' ')[1]
#   puts "Client said: #{request}"

# 	if path == "/hello"
# 		client.puts "<h1>HELLO! </h1>"
# 	elsif path == "/"
# 		client.puts "<h1>index</h1>"
# 	else
# 		client.puts "NOT FOUND"
#   end

#   client.close
# end

require 'pry'
require 'socket'
require 'uri'

server = TCPServer.new 2000


people = {
	"monkey" => {
		location: "tree",
		flavor: "banana"
	},
	"severus" => {
		location: "wizard death placw with dubledore",
		flavor: "coffee"
	},
	"peter parker" => {
		location: "Forest Hills",
		flavor: "fly"
	},
	
}


while true
	client = server.accept

	request = client.gets.chomp
	path = request.split(' ')[1]
	puts "Client said: #{request}"
	
	# acceptable = ["monkey", "severus", "Peter Parker"]

	if path == "/hello"
		current_time = Time.now.strftime("%I:%M:%S%P")
		client.puts "<h1>HELLO! #{current_time}</h1>"
	elsif path == "/"
		client.puts "<h1>index</h1>"

	elsif path.split('/')[1] == "hello" && path.split('/').length == 3
		name = URI.decode(path.split('/')[2])
		if people.keys.include?(name)
			html = "<h1>Hello, #{name.capitalize}</h1>"
			html = html + "<p>Who lives in #{people[name][:location]}</p>"
			html = html + "<p>Who eats #{people[name][:flavor]}</p>"

			client.puts html
		else
		client.puts "<h1>Woah - we do not know you.</h1>"
		end
	else
	
	client.puts "error"	
	end

end
# else
# 	client.puts "Not Found"
