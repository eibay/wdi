require 'pry'
require 'socket'
require 'uri'
#PATH-BASED PARAMETER
server = TCPServer.new 2000
while true
	#connect
	client = server.accept
	client_ip = client.remote_address.ip_address

	#puts "Client has connected from #{client_ip}"

	#listen (keep variable so you can store what they want to operate on it)
	request = client.gets.chomp

	people = {
		"monkey" => {
			location: "a tree",
			flavor: "banana"
		},
		"severus" => {
			location: "the wizard death place with dumbledore",
			flavor: "coffee"
		},
		"peter parker" => {
			location: "Forest Hills",
			flavor: "fly"
		},
	}

	# client says GET /
	# split it so it's easier to read
	path = request.split(" ")[1]
	# client says GET /hello/name
	#namepath_all = request.split("/")

	puts "Client #{client_ip} is attempting to reach #{path}"
	time = Time.now.strftime("%I:%M%P")
	#acceptable = ["monkey", "peter parker", "severus"]
#talk
		if path == "/"
			client.puts "<h1>Index</h1>"
		elsif path == "/hello"
			client.puts "<h1>Hello! The time is #{time}</h1>"
		elsif path.split("/")[1] == "hello" && path.split("/")[2]
			name = URI.decode(path.split("/")[2])
								if people.keys.include?(name)
									html = "<h1>Hello, #{name.capitalize}, </h1>"
									html = html + "<h1>who lives in #{people[name][:location]} </h1>"
									html = html + "<h1>and likes #{people[name][:flavor]} ice cream.</h1>"

									client.puts html
								else client.puts "<h1>Whoa, we do not know you.</h1>"
								end
		else
			client.puts "error"
		end

	#disconnect
	client.close

end