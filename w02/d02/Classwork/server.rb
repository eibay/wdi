require 'socket'
require 'pry'
require 'URI'
server = TCPServer.new 2000



while true
	#connect
	client = server.accept

	#listen - or get input
	
	request = client.gets.chomp
	path = request.split(' ')[1]
	name = URI.decode(path.split('/hello/')[1])
	puts "Client said: #{request}"

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

	#talk

# 	if name == "monkey"
# 		client.puts "<h1> Hello Monkey</h1>"
# 	elsif name == "jeff"
# 		client.puts "<h1> Hello Jeff</h1>"
# 	elsif name == "severus"
# 		client.puts "<h1> Hello Severus</h1>"
# 	else 
# 		client.puts "woah- we do not know you!"
# 	end
# 	client.close
# end

	if people.keys.include?(name)
		html = "<h1> Hello, #{name.capitalize}</h1>"
		html += "<p> Who lives in #{people[name][:location]}</p>"
		html += "<p> Who likes #{people[name][:flavor]} flavored ice cream</p>"
		client.puts html
	
	else 
		client.puts "woah- we do not know you!"
	end
	client.close
end

		

# 	if path == "/hello"
# 		client.puts "<h1>HELLO!</h1>"
# 		client.puts (Time.now.strftime("TODAY IS: %m/%d/%Y AND THE TIME IS %H:%M %p"))	
# 	elsif path== "/"
# 		client.puts "<h1>index</h1>"
# 	elsif path == "/hello/neel"
# 		client.puts "<h1>Hello, Neel</h1>"
# 	elsif path == "/hello/jeff"
# 		client.puts "<h1>Hello, Jeff</h1>"
# 	elsif path == "/hello/#{name}"
# 		client.puts "<h1>Hello #{name}</h1>"
# 	else
# 		client.puts"NOT FOUND!"
# 	end
# 	client.close
# end