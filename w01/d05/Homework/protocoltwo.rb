

# 2. Echo
#   * Client says: `echo word`
#   * Server responds: `You said word`
#   * Client says: `echo another_word`
#   * Server responds: `You said another_word`




require 'socket'

server = TCPServer.new 2000
client = server.accept

puts "A client has connected"
client.puts "Welcome to our server!"
client.puts "Type in a word of your choice and I will say the word you typed"

user_said = client.gets
client.puts ("You said #{user_said}")
puts "#{user_said}"

client.puts "Type in another word of your choice and I will say the word you typed"
user_said = client.gets
client.puts ("You said #{user_said}")
puts "#{user_said}"

client.close
