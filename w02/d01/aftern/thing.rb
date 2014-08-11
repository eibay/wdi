require 'socket'
server = TCPServer.new 2000
client = server.accept




while true
  client = server.accept
  client_ip = client.remote_address.ip_address

  puts "Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(" ")[1]

  puts "Client #{client_ip} is attempting to reach #{path}"

  if path == "/"
  	client.puts File.read('./views/index.html')
  	puts "Sent Hello World to #{client_ip}"
  end

  puts "Client #{client_ip} has disconnected!"

  client.puts "<h1>He who is not courageous enough to take risks will accomplish nothing in life.</h1> <h4>Muhammad Ali</h4>  <a href='10.190.2.98:2000'>Andrea quote</a>"
 
  client.gets.chomp

  client.close
end



thing = string.split(" ")
first_bit = thing[0]
last_bit = thing[(thing.last)]
# to the end of the line ignore this code lots of great code over here (2)
first + last_bit # to the end of the line

if path == "/"
	puts "hello world"
end
