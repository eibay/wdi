require 'socket'
server = TCPServer.new 2000
client = server.accept


answer = rand(9) + 1
puts answer
answertwo = "yes"
clientanswer = 0


while (clientanswer != answer) && (answertwo == "yes")
	client.puts "Guess a number between 1-10"
	clientanswer = client.gets.chomp.to_i
	puts clientanswer	

if answer == clientanswer
	client.puts "You are correct, the number is #{answer}"
	puts "Correct answer is #{answer}"
else 
	client.puts "WRONG, would you like to try again?"
	answertwo = client.gets.chomp.downcase
	puts answertwo
	end

end

client.close