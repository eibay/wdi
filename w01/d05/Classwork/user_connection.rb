require 'socket'

server = TCPServer.new 2000
client = server.accept

puts "Cliet connected!"

user_said = client.gets
client.puts "Hello!"
client.puts "You said #{user_said}"

client.close
