require 'socket'
server = TCPServer.new 2000
require 'uri'
while true
	#connect
client = server.accept
#listen or get input
request = client.gets.chomp
puts "Client said: #{client.gets}" #pretending to listen

path = request.split(" ")[1]
path1 = path.split("/")[1]
people = {
	"monkey"=>
	{location: "tree", 
	flavor: "banana"
	}, 
	"severus" => 
	{location: "wizard death place", 
	flavor: "banana"
	}, 

	"peter parker" => 
	{location: "Forest Hills", 
		flavor: "fly"
		} 
	}

#we split to isolate the things we care about and that is the /
#talk
if path == "/" 
	client.puts "<h1>Index</h1>"
	#only chrome will analyze h1 in ruby
	# OR client.puts File.read ('./views/index.html')
elsif path == "/hello"
	time = Time.now.strftime("%H:%M:%S %p %Z")
	client.puts "<h1>Hello #{time}</h1>"
	# OR client.puts File.read ('./views/hello.html')
elsif path.split('/')[1]=="hello" && path.split('/')[2]
	# acceptable=["monkey", "severus", "peter parker"]
#can use that too.length == 3
	#the second part doesnt have to equal anything because it is asking if there is another part?
	#if yes...
	name = URI.decode(path.split('/')[2])
	# if using arrays -if name == "monkey" || name == "jeff" || name == "severus"
	# if acceptable.include?(name)
	if people.keys.include?(name)
		wow = "<h1>HELLO #{name.upcase}!</h1>"
		#can use any variable
		wow += "<p>Who lives in #{people[name][:location]} and likes #{people[name][:flavor]} </p>"
		client.puts wow
	else client.puts "WOAH!-we do now know you"
	end
else
	
	client.puts "ERROR!!"
end
#disconnect
client.close
end