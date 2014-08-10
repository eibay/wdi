require 'socket'
server = TCPServer.new 2000
client = server.accept
story = [
  'Fry is born without a delta brainwave',
  'As a result, Fry is cryogenically frozen until 2999',
  'In the future, Fry works on a spaceship',
  'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',
]
index=0
client.puts story[index]

client.puts("do you want to continue")
answer = gets.chomp.downcase # I answer on my computer
while answer == "yes" && index < 3
		index += 1
		client.puts story[index]
	unless index == 3
		client.puts("do you want to continue")
		answer = client.gets.chomp.downcase
	end
end



client.puts "Goodbye!"
client.close
