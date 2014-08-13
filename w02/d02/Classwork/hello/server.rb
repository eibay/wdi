require 'socket'
require 'pry'
require 'URI'

server = TCPServer.new 2000

people = {
	"monkey" => {
		location: "tree",
		flavor: "banana"
	},
	"severus" => {
		location: "wizard death place in dumbledore",
		flavor: "coffee"
	},
	"peter parker" => {
		location: "forest hills",
		flavor: "flies"
	}
}

while true
	# connect
	client = server.accept

	# listen - or get input
	request = client.gets.chomp
	path = request.split(" ")[1]
	path_var = request.split("/")[2].split(" ")[0]
	puts "Client said: #{request}"
	current_time = Time.now.strftime("%I:%M%P")

	# talk 
	if path == "/"
		client.puts "<h1> Index </h1>"
	elsif path == "/hello"
		client.puts "<h1> Hello! #{current_time} </h1>"
	elsif path == "/hello/#{path_var}"
		name = URI.decode(path_var)
		if people.keys.include?(name)
			our_output = "<h1> Hello, #{name.capitalize}!"
			our_output += "<p> Who lives in #{people[name][:location]}</p>"
			our_output += "<p> And likes #{people[name][:flavor]} ice cream</p>"
			client.puts our_output
		else 
			client.puts "<h1> Woah - we do not know you. </h1>"
		end
	else
		client.puts "Not found"
	end

	client.close
end