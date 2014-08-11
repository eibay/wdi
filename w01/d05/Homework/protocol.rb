require 'socket'

server = TCPServer.new 2000
client = server.accept

quote = ["And how does that make you feel?",
		"That's interesting, but tell me, do you often sing or whistle just for fun?",
		"A mulatto, an albino, a mosquito, my libido, yay!",
		"The junk merchant doesn't sell his product to the consumer, he sells the consumer to his product. He does not improve and simplify his merchandise. He degrades and simplifies the client.",
		"It's not the spoon that bends, it is only yourself.",
		"What?",
		"Come again?",
		"You talking to me?",
		"I like the blank way you fill up my mind",
		"You know sometimes I really do think that, you know, half way around you'll maybe get it.",
		"I'm not here, this isn't happening",
		"I think god is moving its tongue",
		"We were rich once, before your head exploded",
		"Goo goo g'joob"]

while true
	input = client.gets.chomp
	case input
	when "hello"
		client.puts "HELLO!"
	when "echo word"
		client.puts "You said word"
	when "echo another_word"
		client.puts "You said another_word"
	when "ping"
		client.puts "pong"
	when "guess"
		incorrect = true
		client.puts "Guess a number between 1 and 10"
		while incorrect
			guess = client.gets.chomp
			if guess == "5"
				client.puts "correct!"
				incorrect = false
			else
				client.puts "wrong!"
			end
		end
	else
		client.puts quote.sample
	end
end