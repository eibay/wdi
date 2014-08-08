# With a partner, develop a server program that responds to the following messages:

# Client connects:
# ```bash
# nc IP PORT
# ```
require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "say something: hello, echo, ping, guess, sos"
client_input = client.gets.downcase.chomp

#Hello

case client_input
when "hello"
  client.puts "HELLO!"
when "echo"  
  client.puts "you want to echo"
  client.puts "type echo [word]"
  echoed_word = client.gets.split(" ")[1..-1].chomp
  client.puts "we'll echo #{echoed_word}" ##### doesnt work

  #####
when "ping"
  client.puts "pong"
when "guess"
  client.puts "guess a number between 1 and 10"
  guessed_number = client.gets.chomp
  actual_number = rand(10)
  client.puts "the actual number was #{actual_number}"
  if actual_number == guessed_number
   client.puts "correct!"
  else
    client.puts "wrong!"
  end

when "sos"
  client.puts "Help is on the way!"
   
end
client.close
#192.168.32.137





