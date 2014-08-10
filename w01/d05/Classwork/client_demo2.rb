require 'socket'
server = TCPServer.new 2000
client = server.accept

try_again = [
	"No that ain't it!  Try again!",
	"Nope!  Give it another shot, silly!",
	"Didn't they teach you anything in school?",
	"Sorry no!  Try again.",
	"Whoops!  Did you type that correctly?"
]


questions = [
	""
]

wrong = true
counter = 0
client.puts "Trivia time!"
client.puts "On what tremendous mammal did the great general Hannibal march over the Pyrenees in the Second Punic War?"
while wrong
	answer = client.gets.chomp
	if answer.downcase.include?("elephant")
		client.puts "You got it, you genius!  Thanks for playing!"
		wrong = false
		puts "They got it!"
	else
		client.puts try_again[rand(0..4)]
		counter += 1
		client.puts "Maybe you should Wikipedia it." if counter > 3
		puts "Wrong!  #{counter} wrong tries.  They said #{answer}."
	end
end


client.close