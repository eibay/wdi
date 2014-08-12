
#######################################################

#1
require 'socket'
server = TCPServer.new 2000 
client = server.accept

client.puts "Hello! 'Type 'Hello' for a response!'"

user_response = client.gets.chomp
user_response_1= ["Hello", "Hi", "Hey", "How are you doing?"]

if user_response_1.include?(user_response)
  client.puts "HELLO!"
else
  client.puts "Fine, be that way!"
end
client.close

#######################################################
# 2. Echo
#   * Client says: `echo word`
#   * Server responds: `You said word`
#   * Client says: `echo another_word`
#   * Server responds: `You said another_word`

#2
require 'socket'
server = TCPServer.new 2000 
client = server.accept

client.puts "Let's play a game of telephone. I say something, you say something."
client.puts "Choose a word or phrase: 'Hello', 'Word', 'I hate my life', 'I love coding'"

client_says_word = client.gets.chomp
client_says_word_1 = ["Hello", "Word", "I hate my life", "I love coding"]

if client_says_word_1.include?(client_says_word)
  client.puts "You said #{client_says_word}."
else
  client.puts "You didn't choose a selected word!"
end

client.puts "Say another word!"
client_says_word = client.gets.chomp

if client_says_word_1.include?(client_says_word)
  client.puts "You said #{client_says_word}."
else
  client.puts "You didn't choose a selected word!"
end
client.close

#######################################################

#3
require 'socket'
server = TCPServer.new 2000 
client = server.accept

client.puts "Ping!"
client.puts "This is where you need to type 'Pong!'"

server_reponse = client.gets.chomp
server_reponse_1= ["Pong!"]

if server_reponse_1.include?(server_reponse)
  client.puts "Pong!"
else
  client.puts "Error! Play ping pong you idiot"
end
client.close

#######################################################
#4

require 'socket'
server = TCPServer.new 2000 
client = server.accept

client.puts "Guess a number between 1-10"

server_guess_number= client.gets.chomp
server_guess_number_1= ["5", "6", "7"]

if server_guess_number_1.include?(server_guess_number)
  client.puts ("Correct, great guess!")
else 
  client.puts ("Wrong, try again!")
end
client.close

#######################################################



