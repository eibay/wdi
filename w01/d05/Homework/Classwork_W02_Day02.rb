

# require 'socket'

# server = TCPServer.new 2000

# while true #a loop that will always stay open
# client = server.accept 

# 	client.puts "Hello World!"
# 	request = client.gets.chomp #what you put in code to talk thru browser (i think)
# 	puts request #this goes with the line above

# 	client.close

# end

#192.168.40.152: 2000 - to put in browser, i think


require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!" #this shows up on my computer

  #client.puts "Hello World"
  # client.puts "<h1>Hello World</h1> <a href='http://www.yahoo.com'> this is a link </a>"
  
  #client.puts "<h1>Hello World</h1> <a href='http://10.238.66.111:2000'> Hi Jill </a>"

# after we ran the program Sean decided we should take this out
  # request = client.gets.chomp#just takes the first line of many lines BUT
  # #request = client.read #takes the entire message 
  # puts request

request = client.gets.chomp	

client.close

end


