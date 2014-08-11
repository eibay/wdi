require 'socket'
# require 'pry'
server = TCPServer.new 5757

while true
  client = server.accept
  ip_addr = client.remote_address.ip_address 
  # binding.pry 


  request = client.gets.chomp 
  # split request header & give path 
  path = request.split[1] 
  puts "Client connected from #{ip_addr} & they", "\twant #{path}!" unless path == "/favicon.ico"

  p = "<h1>Hi There!</h1>
  <p>Once there was a world. You could say hello to it. I said hello to it. It responded in kind.</p>
  <p>Now I'm always passing by the things I say. I tip my hat to them. But it's bittersweet. I know the world is gone.</p>"
     
  case path  
  when '/'
  	client.puts p
  	puts "Sent poem to client."
  when "/hello"
  	p = "<h1>Yes, hello to you too!</h1>"
  	client.puts p
  	puts "Said hello to client."
  when "/goodbye"
  	p = "<h1>You say goodbye, but I say hello.</h1>"
  	client.puts p 
  	puts "Wondered why client tried to say goodbye to me."
  when "/favicon.ico"
  	client.puts File.read "./favicon.ico"
  	puts "Gave them a happy favicon."
  when "/html" 
  	client.puts File.read "./views/index.html"
  when "/stylesheets/style.css"
  	client.puts File.read "./stylesheets/style.css"
  	puts "Gave them stylesheet."
  else
  	p = "<h1>404 #{path} not found</h1>"
  	client.puts p 
  	puts "Could not get the client what they wanted."
  end 
 

  client.close
end