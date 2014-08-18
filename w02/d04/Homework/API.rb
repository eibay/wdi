 require 'socket'
 require 'pry'

  client = TCPSocket.new 'www.omdbapi.com', 80
  client.puts 'GET /?s=monkey'

binding.pry
  response = client.gets
  puts response