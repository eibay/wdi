require 'socket'
# require 'pry'
server = TCPServer.new 5757

while true
  client = server.accept
  ip_addr = client.remote_address.ip_address 

  request = client.gets.chomp 
  path = "./" + request.split[1] 
  
  puts "Client connected from #{ip_addr} & they", "\twant #{path}!"

  if File.exists? path
    if File.directory? path 
      client.puts File.read path + "/index.html"
    else
      client.puts File.read path 
    end 
  else 
    client.puts "<h1>404 Not Found</h1>"
  end 
  
  client.close
end