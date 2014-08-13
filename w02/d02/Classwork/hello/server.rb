require 'socket'
require 'pry'
require 'uri'
 
server = TCPServer.new 2000
 
# / -> Index h1
# /hello -> Hello! h1
# /hello/acceptablenames -> <h1>Hello, Name!</h1>
# monkey, severus, peter parker
# Woah - we do not know you.

def hexgen
	hexes = []
	0.upto(9){|x|hexes.push x.to_s}
	"A".upto("F"){|x|hexes.push x}
	code = "#"
	6.times{code += hexes[rand(0..15)]}
	return code
end


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
  # connect
  leader = "<head><style>body {background: #{hexgen}; color: #{hexgen};}</style></head>"
 
  client = server.accept
 
  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "Client said: #{request}"
 
  # talk
  if path == "/hello"
    current_time = Time.now.strftime("%I:%M%P")
    client.puts "<h1>HELLO! #{current_time}</h1>"
  elsif path == "/"
    client.puts "<h1>index</h1>"
  elsif path.split('/')[1] == "hello" && path.split('/').length == 3
    name = URI.decode(path.split('/')[2])
    if people.keys.include?(name)
      our_output =  "#{leader}<h1>Hello, #{name.capitalize}</h1>"
      our_output += "<p>Who lives in #{people[name][:location]}</p>"
      our_output += "<p>And enjoys #{people[name][:flavor]} flavored ice cream!</p>"
      #html += "<p>Who lives in #{people[name][:location]}</p>"
 
      client.puts our_output
    else
      client.puts "<h1>WOAH! We don't know you...</h1>"
    end
  else
    client.puts "NOT FOUND"
  end
 
  # disconnect
  client.close
end