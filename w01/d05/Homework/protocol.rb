require 'socket'
server = TCPServer.new 2000
client = server.accept

#1.
client.puts "say hello"
response = client.gets
client.puts "Hello"



#2.
client.puts "type a word."
requested_word = client.gets
client.puts "echo #{requested_word}"
client.puts "type another word"
requested_word_2 = client.gets
client.puts "echo #{requested_word_2}"



#3.
client.puts "type ping"
requested_word = client.gets
client.puts "pong"



#4.
client.puts "Type guess."
guess = client.gets
client.puts "Guess a number between 1 and 10"
num = client.gets
client.puts "Your number is #{num.to_i}"

if num.to_i <=10
client.puts "correct - your number was between 1 and 10"
else client.puts "wrong - your number was not between 1 and 10"
end

#5.
client.puts "Do you have any animals?"
guess = client.gets
if guess == true
client.puts "CuTe!"
else client.puts "bummer"
end
client.close
