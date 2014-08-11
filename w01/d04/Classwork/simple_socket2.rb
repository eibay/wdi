require 'socket'

server = TCPServer.new 2000
client = server.accept
while true
	user_names = ["tess", "trish", "iris"]

	client.puts "You are now connected to Nastassia's computer!"
	client.puts "What is your name?"
	user_input2 = client.gets.chomp
	puts user_input2.class
	puts user_names.include?(user_input2)

		if user_names.include? user_input2
			client.puts "What's your favorite color?"
			user_input = client.gets
			if user_input.chomp == "green"
				client.puts "omg! I love Green too!"
			else
				client.puts "#{user_input.chomp} is an okay color, but Green is the bomb!"
			end	
			
			client.puts "See ya!"
			client.puts

			client.close

		else

			client.puts "Sorry! You are not a registered user."
			client.puts "See ya!"
			client.puts

			client.close
		end
end
		
# puts user_input
# client.puts "#{user_input} huh?"
# if user_input.chomp == "green"
# 	client.puts "omg! I love Green too!"
# else
# 	client.puts "#{user_input.chomp} is an okay color, but Green is the bomb!"
# end
