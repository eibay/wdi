
# With a partner, develop a server program that responds to the following messages:

# Client connects:
# ```bash
# nc IP PORT
# ```
# 1. Hello
#   * Client says: `hello`
#   * Server responds: `HELLO!`

require 'socket'

server = TCPServer.new 2000
client = server.accept

puts "A client has connected"
client.puts "Welcome to our server!"

user_said = client.gets
client.puts "HELLO!"
puts "#{user_said}"

client.close
