require 'socket'
require 'pry'
require 'uri'

def hexgen
	hexes = []
	0.upto(9){|x|hexes.push x.to_s}
	"A".upto("F"){|x|hexes.push x}
	code = "#"
	6.times{code += hexes[rand(0..15)]}
	return code
end

server = TCPServer.new 2000

while true

	rejected = "<head><style>body {\nbackground-color: #{hexgen};\ncolor: #{hexgen};\n}</style></head>"

	acceptable_names = ["monkey", "severus", "snape", "peter parker"]

	client = server.accept

	request = client.gets.chomp

	path = request.split(" ")[1]

	puts "Client said #{request}"

	if path == "/"
		client.puts "<h1>index</h1>"
	elsif path == "/hello"
		client.puts "<h1>HELLO!  #{Time.now.strftime("%l:%M%P")}</h1>"
	elsif path.split("/").length == 3 && path.split("/")[1] = "hello"
		name = path.split("/")[2]
		if acceptable_names.include?(name)
			client.puts "<h1>Hello, #{name.capitalize)}!</h1>"
		else
			client.puts "#{rejected}<h1>Woah - we do not know you.</h1>"
		end
	else
		client.puts "NOT FOUND"
	end

	client.close

end