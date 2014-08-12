require 'socket'
require 'erb'
# require 'pry'

server = TCPServer.new 5757
students = {harry: {name: "Harry Potter", bio: "He is the boy who lived but he doesn't like to talk about it that much partly because he just learned about it five seconds ago and it's not what he knows.", house: "Giffindoor"}, 
  ron: {name: "Ron Weasley", bio: "He has red hair. He is rather ornery. He is married to Hermione.", house: "Giffindoor"}, 
  hermione: {name: "Hermione Granger", bio: "She is woah smart. Her name is from Hermes because, like, some reason.", house: "Giffindoor"}}

# have half a mind to shovel students into arrays, let there be a reference to them, etc  
good_students = []
evil_students = []
houses = {griffindoor: good_students, slitherand: evil_students} 


while true
  client = server.accept
  ip_addr = client.remote_address.ip_address 

  request = client.gets.chomp 
  path = request.split[1] 
  
  puts "Client connected from #{ip_addr} & they", "\twant #{path}!" 

  if path == '/'
    puts "Sent them the home view appropriately modified!"
  end 

  if students.include? path.delete('/').to_sym
    student = students[path.delete('/').to_sym]
    v = File.read "./views/students/index.html.erb" 
    e = ERB.new v 
    p = e.result binding 
    puts p 
    client.puts p
    puts "Sent them the students view appropriately modified!"
  end

  if houses.include? path.delete('/').to_sym
    client.puts File.read "./views/houses/index.html.erb"
    puts "Sent them the houses view appropriately modified!"
  end 

  client.close
end