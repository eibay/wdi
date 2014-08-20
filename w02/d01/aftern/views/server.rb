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
  	client.puts File.read('index.html')
  	puts "Sent Hello World to #{client_ip}"
  elsif path == "/stylesheet.css"
    client.puts File.read(/stylesheet.css)
  end

  puts "Client #{client_ip} has disconnected!"

  client.close
end

