require "socket"
require "pry"

server = TCPServer.new 2000

while true


  client = server.accept
  client_ip = client.remote_address.ip_address

  # binding.pry

  puts "Client has connected from #{client_ip}"

  request = client.gets.chomp #First line of the url aka request header

  path = request.split[1] #Finding a path within the request header aka website subpaths, webpages

  puts "Client #{client_ip} is attempting to reach #{path}"

  if path == "/"
    client.puts File.read("./views/index.html")
    puts "Sent 'index.html' to #{client_ip}"

    elsif path == "/stylesheets/style.css"
      client.puts File.read("./views/stylesheets/style.css")
    puts "Sent 'style/css' to #{client_ip}"

  elsif path == "/about.html"
    client.puts File.read("./views/about.html")
    puts "Sent 'about.html' to #{client_ip}"

  end

  # binding.pry
  puts "Client #{client_ip} has disconnected"

  client.close

end
