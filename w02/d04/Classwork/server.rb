
# goal is to get info from an outside website and bring it into ours

require 'socket'
require 'pry'

server = TCPServer.new 2000

while true
  client = server.accept
  puts "Client connected"
  client_ip = client.remote_address.ip_address
  puts "#{Time.now} - Client has connected from #{client_ip}"

#ask about removing the .chomp - he removed it in one place but not in another
#not clear why

  request = client.gets.chomp #this is the short version / first line of the request header, i.e.
  							  #what the browser is looking for
  							  #client.reads gives more detail

   path = request.split('')[1]
   puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

if path = '/'
	client.puts 
# goal is to get the info from an outside website 

jeffs_api = TCPSocket.new 192.168.40.172, 8000
#at this point after this step, we're connected and simply waiting
#nc 192.168.40.172, 8000 - just waits after this
#but if i type GET /weather, then it spits back the weather
#so in ruby
jeffs_api.puts "GET /weather"

puts "#{Time.now} - Client #{client_ip} connecting to Jeff's Weather Server"

#how we'd do this if we were just getting info from the client/browswer
#response = client.gets.chomp

#BUT in this version we want to get data from jeffs_api NOT the client/browser
#old
#response = jeffs_api.gets #Neel removed .chomp from the end of this, ASK WHY.


#in this, his response is in json: 
#response = json = "{\"weather\":\"69 F\",\"humidity\":\"56%\",\"hash_crap\":true}\n"

json_response = jeffs_api.gets
parsed_respnse = JSON.parse(json_response)
#JSON.parse makes everything in the repsonse into strings


jeffs_api.close #we use this to close the connection to jeffs_api
puts "#{Time.now} - Disconnected from Jeff's Weather Server"


#non JSON approach
#client.puts response  
#this puts Jeff's weather info onto our site/server 
#and shares it with the client/browser

#JSON approach

client.puts "The temperature outside is #{parsed_respnse["weather"]}, while the humidity is #{parsed_respnse[humidity]}. And also, hash crap is #{parsed_respnse["hash_crap"]}



end
puts "#{Time.now} - Client #{client_ip} has disconnected" 
#comes after the while loop ends

client.close
  puts "Client disconnected"
end