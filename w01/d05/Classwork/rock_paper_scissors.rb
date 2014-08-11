require 'socket'

server = TCPServer.new 2000
client = server.accept
#puts doesn't put to their screen

# client.puts "write something" #this shows on clientside
# user_said = client.gets #gets input form clientside

# client.puts "Hello!" 
# client.puts "#{choice_server} vs #{choice_client}. you said #{user_said}"
# puts "#{user_said}" #sends to serverside

# puts "how to respond?" # puts to serverside
# message = gets # gets from serverside

# client.puts "#{message}" # sends back to client side

puts "time to play a game"
client.puts "time to play a game"

client.puts "who are you?"
puts "who are you?"

name_client = client.gets.chomp.upcase
name_server = gets.chomp.upcase

client.puts "#{name_client} is challenging #{name_server} to Rock, Paper, Scissors!"
puts "#{name_client} is challenging #{name_server} to Rock, Paper, Scissors!"

#{name_client}

puts "make a choice: rock, paper, or scissors"
choice_server = gets.downcase.chomp

client.puts "make a choice: rock, paper, or scissors"
choice_client = client.gets.downcase.chomp

#messages
you_tie = "#{choice_server} vs #{choice_client}. you tie!"
you_lose = "#{choice_server} vs #{choice_client}. you lose!"
you_win = "#{choice_server} vs #{choice_client}. you win!"



#### case

case choice_server

when choice_client
	client.puts you_tie
	puts you_tie
when "rock"
	if choice_client == "scissors" 
		client.puts you_lose
		puts you_win
	elsif choice_client == "paper"
		client.puts you_win
		puts you_lose
	end
when "paper"
	if choice_client == "scissors"
		client.puts you_win
		puts you_lose
	elsif choice_client == "rock"
		client.puts you_lose
		puts you_win
	end
when "scissors" 
	if choice_client == "rock"
		client.puts you_win
		puts you_lose
	elsif choice_client == "paper"
		client.puts you_lose
		puts you_win
	end
end


client.close

# #if tie
# if choice_server == choice_client
# 	client.puts you_tie
# 	puts you_tie

# #for rock
# elsif choice_server == "rock" && choice_client == "scissors"
# 	client.puts you_lose
# 	puts you_win

# elsif choice_server == "rock" && choice_client == "paper"
# 	client.puts you_win
# 	puts you_lose

# # for paper
# elsif choice_server == "paper" && choice_client == "scissors"
# 	client.puts you_win
# 	puts you_lose

# elsif choice_server == "paper" && choice_client == "rock"
# 	client.puts you_lose
# 	puts you_win

# # scissors
# elsif choice_server == "scissors" && choice_client == "rock"
# 	client.puts you_win
# 	puts you_lose
# elsif choice_server == "scissors" && choice_client == "paper"
# 	client.puts you_lose
# 	puts you_win
# end


# #### nested conditions

# if choice_server == choice_client
# 	client.puts you_tie
# 	puts you_tie

# elsif choice_server == "rock"
# 	if choice_client == "scissors" 
# 		client.puts you_lose
# 		puts you_win
# 	elsif choice_client == "paper"
# 		client.puts you_win
# 		puts you_lose
# 	end

# elsif choice_server == "paper"
# 	if choice_client == "scissors"
# 		client.puts you_win
# 		puts you_lose
# 	elsif choice_client == "rock"
# 		client.puts you_lose
# 		puts you_win
# 	end

# elsif choice_server == "scissors" 
# 	if choice_client == "rock"
# 		client.puts you_win
# 		puts you_lose
# 	elsif choice_client == "paper"
# 		client.puts you_lose
# 		puts you_win
# 	end
# end



# puts "#{choice_server} vs #{choice_client}. your choice was #{choice_server} and client's choice was #{choice_client}, who won?"
# client.puts "#{choice_server} vs #{choice_client}. your choice was #{choice_client} and client's choice was #{choice_server}, who won?"




#192.168.32.137



