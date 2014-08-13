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
	#connect
	client = server.accept

	#listen - or get input
	request = client.gets.chomp
	path = request.split(" ")[1]
	name = path.split("/")[2]

	# this is done to isolate the "/" to only obtain the info we care about.
	puts "Client said #{request}"

# binding.pry
	
	#talk	
	if path == "/" 
		client.puts "<h1>Index</h1>"

	elsif path == "/hello"
		time = Time.now.strftime("%I:%M%P")	
		client.puts "<h1>Hello! #{time}</h1>"

	elsif path == "/hello/#{name}"
		name = URI.decode(name)
		cap_name = name.capitalize
		if people.keys.include?(name)
			client.puts "<h1>Hello, #{name.capitalize}.</h1>" 
			client.puts "<p>How is the weather in #{people[name][:location]}?</p>"
			client.puts "<p>Have any #{people[name][:flavor]} lately?</p>"
			# html += "<p>Who lives in #{people[name][:location]}</p>"
		else
			client.puts "<h1>WHOA!! Who are you??</h1>"
		end

	end


	client.close

end