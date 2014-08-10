require 'socket'
server = TCPServer.new 2000
client = server.accept
looper = 0
while looper < 2
	client.puts "say a word with echo"
	answer = (client.gets.chomp.downcase).split(" ")
	puts answer[1]
	client.puts "You said #{answer[1]}"
	looper += 1
end
client.close