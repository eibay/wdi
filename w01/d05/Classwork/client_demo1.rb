require 'socket'
server = TCPServer.new 2000
client = server.accept

story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]

index = 0
read = "y"

while index < story.length && read == "y"
	client.puts story[index]
	unless index == story.length - 1
		client.puts "...would you like to hear the next part of the story?  Please enter y or n"
		read = client.gets.chomp
	else
		client.puts "...and that's the end!"
	end
	if read != "y"
		client.puts "I'm terribly sorry to have bored you."
	else
		index = index + 1
	end
end

client.close