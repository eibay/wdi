require 'socket'
server = TCPServer.new 2000
client = server.accept


score = 0
num_of_q = 0
while num_of_q < 10

operandom = rand(2) + 1
correct_answer = false

if operandom == 1
left_side = rand(9) + 1
right_side = rand(9) + 1
client.puts("#{left_side} + #{right_side} = ?")
user_ans = client.gets.chomp.to_i
if user_ans == left_side + right_side
correct_answer = true
else
end
end

if operandom == 2
left_side = rand(9) + 1
right_side = rand(9) + 1
client.puts("#{left_side} - #{right_side} = ?")
user_ans = client.gets.chomp.to_i
if user_ans == left_side - right_side
correct_answer = true
else
end
end

if operandom == 3
left_side = rand(9) + 1
right_side = rand(9) + 1
client.puts("#{left_side} * #{right_side} = ?")
user_ans = client.gets.chomp.to_i
if user_ans == left_side * right_side
correct_answer = true
else
end
end

if correct_answer == true
score += 1
num_of_q += 1
puts("Hooray")
else
puts("boo")
num_of_q += 1
end
end


client.puts("#{score} out of 10")
if score <= 5
client.puts("FAIL")
elsif score == 6
client.puts("D")
elsif score == 7
client.puts("C")
elsif score == 8
client.puts("B")
elsif score == 9
client.puts("A")
else 
client.puts("WOW!")
end



client.close