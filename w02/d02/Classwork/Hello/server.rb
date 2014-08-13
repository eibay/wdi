require "socket"
require "URI"
require "pry"
server = TCPServer.new 2000

while true
#connect	
client = server.accept

#listen or get input
request = client.gets.chomp
	
path = request.split(" ")[1]
name = path.split("/")

# acceptable_names = ["jeff", "monkey", "severus", "peter parker"] 
date = Time.now.strftime("%m/%d/%Y")
time = Time.now.strftime("%H:%M")

people = {
	"monkey" => {
		location: "tree", 
		flavor: "banana"
	}, 
	"severus" => {
		location: "wizard heaven", 
		flavor: "coffee"
	},
	"peter parker" => {
		location: "Forest Hills",
		flavor: "fly"
	}

}



#talk
if path == "/hello"
	client.puts "<h1>Well hello there. <br> Today is #{date} at #{time} o'clock</h1>"
	puts "client sent Hello page"

elsif (name.length == 3) && (name[1] == "hello") 
	param = URI.decode(path.split("/")[2])
	if people.keys.include?(param)
		client.puts "<h1>Hello, #{param} </h1> <br> <p> You live in #{people[param][:location]}</p> <br> Your favorite flavor of icecream is #{people[param][:flavor]}"
	end
elsif (name.length == 3) && (name[1] == "hello")
	client.puts "<h1>Whoa! We do not know you.</h1>"
elsif path == "/"
	client.puts "<h1>This is the index page</h1>"
	puts "client sent index page"
else 
	client.puts "#{path} unavailable"
	puts "<h1>client requested unavailable path: #{path}</h1>"
end 

client.close
end 