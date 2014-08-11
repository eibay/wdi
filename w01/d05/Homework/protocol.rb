require 'socket'
server = TCPServer.new 2000
client = server.accept

puts("which protocol would you like to see? Please enter a digit between 1 and 5.")
proto = gets.chomp

if proto == "1"
	client.puts "say 'hello'"
	answer = client.gets.chomp.downcase
	puts answer 

	if answer == "hello"
		client.puts "HELLO!"
	else 
		client.puts "wrong answer"
	end

#///////////////////////////////////

elsif proto == "2"

looper = 0

while looper < 2
	client.puts "say a word with echo"
	answer = (client.gets.chomp.downcase).split(" ")
	puts answer[1]
	client.puts "You said #{answer[1]}"
	looper += 1
end

#///////////////////////////////////

elsif proto == "3"

client.puts "say ping"
answer = client.gets.chomp.downcase
puts answer

if answer == "ping"
	client.puts "pong"
else 
	client.puts "no answer"
end 

#///////////////////////////////////

elsif proto == "4"

answer = rand(9) + 1
puts answer
answertwo = "yes"
clientanswer = 0

while (clientanswer != answer) && (answertwo == "yes")
	client.puts "Guess a number between 1-10"
	clientanswer = client.gets.chomp.to_i
	puts clientanswer 
	if 
		answer == clientanswer
		client.puts "You are correct, the number is #{answer}"
		puts "Correct answer is #{answer}"
	else 
		client.puts "WRONG, would you like to try again? (yes or no)"
		answertwo = client.gets.chomp.downcase
		puts answertwo
		if answertwo == "no"
			puts ("FINE THEN!")
		end
	end
end


#///////////////////////////////////
elsif proto == "5"

client.puts("Time for ten math problems. Good luck!")
score = 0
num_of_q = 0 #number of questions

while num_of_q < 10
	operandom = rand(2) + 1
	correct_answer = false
	if 
		operandom == 1
		left_side = rand(9) + 1
		right_side = rand(9) + 1
		client.puts("#{left_side} + #{right_side} = ?")
		user_ans = client.gets.chomp.to_i
		if 
			user_ans == left_side + right_side
			correct_answer = true
		else
		end
	end
	if 
		operandom == 2
		left_side = rand(9) + 1
		right_side = rand(9) + 1
		client.puts("#{left_side} - #{right_side} = ?")
		user_ans = client.gets.chomp.to_i
		if 
			user_ans == left_side - right_side
			correct_answer = true
		else
		end
	end

	if 
		operandom == 3
		left_side = rand(9) + 1
		right_side = rand(9) + 1
		client.puts("#{left_side} * #{right_side} = ?")
		user_ans = client.gets.chomp.to_i
		if 
			user_ans == left_side * right_side
			correct_answer = true
		else
		end
	end

	if 
		correct_answer == true
		score += 1
		num_of_q += 1
		puts("Hooray")
	else
	puts("boo")
	num_of_q += 1
	end
end

client.puts("#{score} out of 10")
if 
	score <= 5
	client.puts("FAIL")
elsif 
	score == 6
	client.puts("D")
elsif 
	score == 7
	client.puts("C")
elsif 
	score == 8
	client.puts("B")
elsif 
	score == 9
	client.puts("A")
else 
	client.puts("WOW!")
end

else
	puts("hmm...")
end
client.close