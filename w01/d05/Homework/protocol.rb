# With a partner, develop a server program that responds to the following messages:

# Client connects:
# ```bash
# nc IP PORT
# ```
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

# 5. Come up with your own protocol!

# 1. Hello

# require 'socket'

# server = TCPServer.new 2001
# client = server.accept

# client.puts "Say hello :)"

# user_said = client.gets
# client.puts "#{user_said}"
# client.puts "Hello!"

# client.close


# 2. Echo

# require 'socket'

# server = TCPServer.new 2002
# client = server.accept

# client.puts "Say something!"
# user_said_one = client.gets.chomp

# client.puts "Echo #{user_said_one}"
# client.puts "You said #{user_said_one}"

# client.puts "Say something else!"

# user_said_two = client.gets.chomp
# client.puts "Echo #{user_said_two}"
# client.puts "You said #{user_said_two}"

# client.close


# 3. Ping Pong

# require 'socket'

# server = TCPServer.new 2003
# client = server.accept

# answer = true

# while answer == "yes" || answer == true

# client.puts "Say ping!"
# user_said = client.gets.chomp.downcase

#   if user_said == "ping"
#     client.puts "pong"
#     client.close
#   else
#     client.puts "Do you want to continue? yes/no"
#     answer = client.gets.chomp.downcase
#     unless answer == "yes"
#       client.puts "Okay, see you!"
#       return answer = false
#     end
#   end
# end


# client.close


# 4. Guess the number

require 'socket'

server = TCPServer.new 2003
client = server.accept

answer = true

while answer == "yes" || answer == true

client.puts "Say 'Guess' to play a game"
user_said = client.gets.chomp.downcase
if user_said == "guess"
  client.puts "guess a number between 1 and 10"
  user_said_two = client.gets.chomp.to_i
  if user_said_two == rand(10)
    client.puts "Right!"
  else
    client.puts "Wrong!"
    client.puts "Do you want to continue? yes/no"
    answer = client.gets.chomp.downcase
    unless answer == "yes"
      client.puts "Okay, see you!"
      return answer = false
    end
    end
  end
end

client.close


