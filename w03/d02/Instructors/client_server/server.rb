require 'socket'

server = TCPServer.new 2000

client = server.accept

client.gets

<<<<<<< HEAD
client.puts "hello world!"
=======
client.puts File.read('./index.html')
>>>>>>> bc740bd96e5fb8d8eb8261e22e004d18062d9618

client.close