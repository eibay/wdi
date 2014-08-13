require 'socket'

server = TCPServer.new 3000

people = {
  "monkey" => {
    location: "tree",
    flavor: "banana"
  },
  "severus" => {
    location: "wizard death place with dumbledore",
    flavor: "coffee"
  },
  "jeff" => {
    location: "Forest Hills",
    flavor: "fly"
  }
}

##################################################

while true
	#client connecting

	client = server.accept 

	#listen; getting input. 

	request = client.gets.chomp #request is the variable, is arbitrary
	puts "Client said: #{request}"
	path = request.split(" ")[1] #referring to the '/'
	
	# if talking
	any_name = path.split("/")[2] #path.split [0] " ", [1] "hello" [2] "mike"
	
	if path == "/" #path is the variable, is arbitrary
		client.puts "<h1> index </h1>"
	
	elsif path == "/hello"
		current_time = Time.now.strftime("%I:%M%P")
		client.puts "<h1> Hello! It's #{current_time}</h1>"
	
	# elsif path == "/hello/jeff"
	# 	client.puts "<h1> Hello Jeff! <h1>"
	
	# elsif path == "/hello/neel"
	# 	client.puts "<h1> Hello Neel! </h1>"	

	elsif path == "/hello/#{any_name}"
		# client.puts "<h1> Hello #{any_name}! </h1>"		
	# # else 
	# # 	client.puts " NOT FOUND "
	# # end

##################################################

# 	if any_name == "monkey" || any_name == "jeff" || any_name == "severus"
# 		client.puts  "<h1> Hello #{any_name}! </h1>"
# 	else 
# 		client.puts "<h1> Woah we don't know you! </h1>"
# end
# end
# client.close
# end

##################################################
# #CLEANER WAY OF DOING IT.

# any_name = path.split("/")[2]
# acceptable = ["monkey", "jeff", "severus"]

if people.keys.include?(any_name) #looking at the keys in the hash
	# client.puts "<h1> Hey #{any_name}! </h1>"
	our_output = "<h1> Hello #{any_name}. </h1>"
	our_output_1 = "<p> Who lives in #{people[any_name][:location]} </p>"
	our_output_2 = "<p> Who loves in #{people[any_name][:flavor]} </p>"

client.puts our_output
client.puts our_output_1
client.puts our_output_2
else
	client.puts "<h1> WHOA WE DON'T KNOW YOU! </h1>"
end
end
client.close
end




