require 'socket'
require 'pry'
require 'URI'
server = TCPServer.new 2000

people = {
	"monkey" => {
		location: "tree",
		flavor: "banana"
	},
	"severus" => {
		location: "wizard death place",
		flavor: "coffee"
	},
		
	
	"peter parker" => {
		location: "Forest Hills",
		flavor: "flies"
	},
	"spongebob squarepants" => {
		location: "pineapple under the sea",
		flavor: "Krabby patty"
	}
}




while true
current_time = Time.now.strftime("%I:%M%P")
# has to be inside while loop because  if its outside, it will never change.
# while loop refereshes as its a while loop
# if it were outside while loop, above, it would only happen when you
# start the program
# now time shall be measured with every request, ever refresh.
	####### CONNECT #######
	client = server.accept

	# client.puts "Client said : #{client.gets}"
	# client.puts "HELLO!"

	####### LISTEN / Get input #######
	request = client.gets.chomp
	path = request.split(" ")[1]
	name = path.split("/")[2]

 #binding.pry
	#listen"
	if path == "/" 
		client.puts "<h1> index </h1> "
	elsif path == "/hello"
		client.puts "<h1> Hello! #{current_time}</h1>"
	elsif path == "/hello/#{name}" #originally it didn't work when i had a non nested name2 variable up there.
		name = URI.decode(path.split('/')[2])
	    if people.keys.include?(name)
	    	html = "<h1> hello, #{name.capitalize} </h1>"
	    	html += "<p>, who lives in #{people[name][:location]}</p>"
	    	html += "<p>, and whose favorite flavor is #{people[name][:flavor]}"
	      client.puts "<h1> #{html} </h1>"
	    else
	      client.puts "<h1>WOAH! We don't know you...</h1>"
	    end
#for two names
		# if name.include?("%20")
		# 	name = name.split("%20")[0].to_s + " " + name.split("%20")[1].to_s
		# 	client.puts "<h1> Hello, #{name} </h1>" 
		# else
		# client.puts "<h1> Hello, #{name} </h1>" 
		# end



#attempting to recreate the URI ruby library thing, for unlimited names

# 		if name.include?("%20")
# 			spaces = name.split("%20").length
# 			array = []

			
# 			while spaces >= 0
# 				namepart=name.split("%20")[spaces]
# 				array << namepart
# 				spaces -= 1
# 			end
# 		array.delete_at(0)
# 		final_name = array.reverse.join(" ")
		

# 		client.puts "<h1> Hello, #{final_name} </h1>"

# 		else
# 		client.puts "<h1> Hello, #{name} </h1>" 
# 		end




	# elsif path == "/hello/#{name}%20#{name2}"
	# 	client.puts "<h1> Hello, #{name} #{name2}"
	# acceptable = ["monkey", "jeff", "severus"]
		# if acceptable.include?(name)
		# 	client.puts "<h1> Hello, #{name} </h1>" 
		# else 
		# 	client.puts "<h1> Woah, we do not know you."
		# end



	end




	client.close

end