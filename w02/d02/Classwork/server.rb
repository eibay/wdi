require 'socket'
require 'uri'
require 'pry'


server = TCPServer.new 2000

# / -> Index h1
# /hello -> Hello! h1
# /hello/jeff -> Hello, Jeff!
# /hello/neel -> Hello, Neel!
# /hello/acceptablename -> <h1>Hello, Name!</h1>
# monkey, severus, peter parker
# Woah - we do not know you.

people = {
	"monkey" => {
		location: "tree",
		flavor: "banana"
	},
	"severus" => {
		location: "wizard death place with dumbedore",
		flavor: "coffee"
	},
	"peter parker" => {
		location: "Forest Hills",
		flavor: "fly"
	}
}

while
	client = server.accept
	client_ip = client.remote_address.ip_address
	request = client.gets
	path = request.split(" ")[1]
	name_path = URI.decode(path.split("/")[2])
	acceptable_name = ["monkey", "jeff", "severus"]

	# puts "Client said: #{client.gets}"
	# if path == "/"
	# 	client.puts File.read('./views/index.html')
	# 	puts "Sent 'index.html' to #{client_ip}"
	# elsif path == "/hello"
	# 	client.puts File.read('./views/hello/hello.html')
	# 	puts "Sent 'hello.html' to #{client_ip}"
	# else
	# 	client.puts "Not found! 404"
	# end

	if path == "/"
		client.puts "<h1>index</h1>"
	elsif path == "/hello"
		current_time = Time.now.strftime("%I:%M%P")
		client.puts "<h1>Hello! #{current_time}</h1>"
	elsif path == "/hello/#{name_path}"
		if people.keys.include?(name_path)
			html =  "<h1>Hello, #{name_path.capitalize}!</h1>"
			html += "<p>Who lives in #{people[name_path][:location]}</p>"
			html += "<p>Who's favorite flavor is #{people[name_path][:flavor]}</p>"

			client.puts html
		else
			client.puts "Woah - we do not know you."
		end		  
	else
		client.puts "NOT FOUND"
	end

	client.close
end
	
