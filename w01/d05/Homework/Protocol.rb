# require 'socket'

# server = TCPServer.new 2000
# client = server.accept

# client
# client.puts "Hello?"
# response = client.gets




# # user_said = client.gets
# # client.puts "Hello!"
# # client.puts "You said #{user_said}"
# # client.puts "See ya later!"

# client.close



# 1. Hello

#   * Client says: `hello`
#   * Server responds: `HELLO!`

# 2. Echo
#   * Client says: `echo word`
#   * Server responds: `You said word`
#   * Client says: `echo another_word`
#   * Server responds: `You said another_word`

# 3. Ping Pong
#   * Client says: `ping`
#   * Server says: `pong`

# 4. Guess the number
#   * Client says: `guess`
#   * Server says: `guess a number between 1 and 10`
#   * Client says: `5`
#   * Server says: if right - `correct!`, if wrong - `wrong!`



require 'socket'

server = TCPServer.new 2000
client = server.accept


client.puts "type a word."
requested_word = client.gets
client.puts "echo #{requested_word}"
client.puts "type another word"
requested_word_2 = client.gets
client.puts "echo #{requested_word_2}"

client.puts "type ping"
requested_word = client.gets
client.puts "pong"

client.puts "Type guess okay?"
guess = client.gets
client.puts "Guess a number between 1 and 10?"
num = client.gets
client.puts "Your number is #{num.to_i}"

if num.to_i <=10
	client.puts "correct - your number was between 1 and 10"
	else client.puts "wrong - your number was not between 1 and 10"
end

client.puts "Let's add? What's 2 + 2"
answer = client.gets

if answer.to_i == 4
	client.puts "correct - you get a gold star"
	else client.puts "wrong - go back to grade school - lol1"
end


client.close











