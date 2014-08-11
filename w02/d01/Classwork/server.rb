require 'socket'
# require 'pry'
server = TCPServer.new 5757

while true
  client = server.accept
  # binding.pry 

  puts "Client connected!"

  p = "<h1>Hi There!</h1><p>Once there was a world. You could say hello to it. I said hello to it. It responded in kind.</p><p>Now I'm always passing by the things I say. I tip my hat to them. But it's bittersweet. I know the world is gone.</p>"

  c = client.gets.chomp 
  puts c 
  client.puts p 

  # split route string & give index 1 
  route = c.split[1]
  puts route 

  client.close
end