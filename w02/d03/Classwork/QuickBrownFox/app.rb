require 'socket'
require 'pry'


server = TCPServer.new 2000


animals = [
		{ 
		animal_1: "fox",
		adj_1: "quick",
		color: "brown",
		verb: "jumps",
		prep: "over",
		adj_2: "lazy",
		animal_2: "dog"
		},
		{
		animal_1: "pig",
		adj_1: "fat",
		color: "pink",
		verb: "rolls",
		prep: "under",
		adj_2: "sleepy",
		animal_2: "cow"
		}
]


while true 
client = server.accept
puts "client connected"
request = client.gets.chomp
path = request.split(' ')[1]
puts "requesting path" 

    i = 0
    while i < animals.length
      if animals[i][:name] == path.split("/")
        animal = animals[i]
      end

      i += 1
    end


animal_1 = animal[:animal_1]
adj_1 = animal[:adj_1]
color = animal[:color]
verb = animal[:verb]
prep = animal[:prep]
adj_2 = animal[:adj_2]
animal_2 = animal[:animal_2]

	if path == "/fox"
	n = 0

	html = File.read("./index.html")
	html = html.gsub('{{animal_1}}', animal_1)
	html = html.gsub('{{adj_1}}', adj_1)
	html = html.gsub('{{color}}', color)
	html = html.gsub('{{verb}}', verb)
	html = html.gsub('{{prep}}', prep)
	html = html.gsub('{{adj_2}}', adj_2)
	html = html.gsub('{{animal_2}}', animal_2)

	client.puts html

	elsif path == "/pig"
	n = 1

	html = File.read("./index.html")
	html = html.gsub('{{animal_1}}', animal_1)
	html = html.gsub('{{adj_1}}', adj_1)
	html = html.gsub('{{color}}', color)
	html = html.gsub('{{verb}}', verb)
	html = html.gsub('{{prep}}', prep)
	html = html.gsub('{{adj_2}}', adj_2)
	html = html.gsub('{{animal_2}}', animal_2)

	client.puts html


	end



end