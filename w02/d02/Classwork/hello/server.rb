require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000

while true

  # Connect
client = server.accept

  # Listen
request = client.gets.chomp
path = request.split(" ")[1] #127.0.0.1:2000/hello/monkey, bascially ans is hello
#result =
# / = 0
# hello = 1,
# / = 2,
#monkey = 3

#127.0.0.1:2000/hello
#127.0.0.1:2000/monkey
#127.0.0.1:2000/peter parker

puts "Client said: #{request}"
name = path.split("/")[2] #monkey, severus, peter parker
# acceptable_names = ["monkey", "severus", "peter parker"]

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

  # Talk
if path == "/" #Client says if my path is root to server, gime Index
    client.puts "<h1>Index</h1>"

elsif path == "/hello" #Client says if my path is /hello to server, gime hello
    current_time = Time.now.strftime("%I:%M%P")
    client.puts "<h1>HELLO! #{current_time}</h1>"

elsif path == "/hello/#{name}"
  name = URI.decode(name)
  if people.keys.include?(name)
  cap_name = name.capitalize
  client.puts "<h1> Hello, #{cap_name}! , who lives in #{people[name][:location]},
  and who's favorite flavor is #{people[name][:flavor]} icecream!!</h1>"
  else
  client.puts "<h1>Woah - we do not know you!</h1>"
end


end

# binding.pry

# Disconnect
client.close

end #end while loop