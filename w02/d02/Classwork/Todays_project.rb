require 'socket'
require 'uri'

server = TCPServer.new 2000

while true
	##connect
	client = server.accept

#people is a 2-level nested pry top hash = monkey, second-level = the names of the people
#which holds details about them 

people = {
  "monkey" => {
    location: "tree",
    flavor: "banana"
  },
  "severus" => {
    location: "wizard death place with dumbledore",
    flavor: "coffee"
  },
  "peter parker" => {
    location: "Forest Hills",
    flavor: "fly"
  }
}

	##listen 
	request = client.gets.chomp #need this to have a reference to know what they're looking for
	client.puts "Client said: #{request}" 
	#this line above is basically just a server log of this point in the connection
	path = request.split('')[1]

      #my first version of path splitting to get name - also valid
        # split_path = path.split #this is to get the array of subpieces including name 
        #                         #out of the path
        # hello_name = split_path[2] #this is to pull the name specifically 
        #                            #from the subpieces array


## talk
  if path == "/hello" #dont understand why this would be a path option because
     #when I saw the client said bit in command line it said 
     #Client said: GET / HTTP/1.1
     # Tejal said  hello IS there because the path name that we see is only the short version
     #of the name, but if we had done request = client.reads we would have gotten
     #the long form of the answer, which would have had /hello in it.
  	
  	current_time = Time.new.strftime("%I %M %P")
    client.puts "<h1>HELLO! #{current_time.strftime} </h1>"
  elsif path == "/"
    client.puts "<h1>index</h1>"
  elsif path == "/hello/jeff"
    client.puts "<h1>Hello, Jeff!</h1>"
  #my first version of this - also valid
  # elsif path == "/hello/#{hello_name}"
  #   client.puts "<h1>Hello, #{hello_name}/</h1>"
  #Jeff did it this way:
  #elsif path.split('/')[1] == "hello" && path.split('/')[2] == hello_name 
   #and this way
  elsif path.split('/')[1] == "hello" && path.length == 3 #if path follows this pattern
    name = path.split('/')[2].capitalize #old way
    #new way
    name = URI.decode(path.split('/')[2].capitalize) #to account for space in peter parker

    acceptible_names = ["monkey", "peter parker", "severus"]
        if acceptible_names.include?(name) #old simple non-hash version
        if people.keys.include?(name) #acceptible_names are now the key values in the new people hash
            #second, simpler option
            #if name == "monkey" or name == "jeff" or name = "monkey"
        our_output = client.puts "<h1>Hello, #{name.capitalize}</h1>"
        our_output = our_output + "<p>who lives in #[people[name][:location]]</p>"
        #hash access [hash(key) => value]
        our_output = our_output + "<p>who likes in #[people[name][:flavor]]</p>"

        else
        client.puts "<h1>WOAH! We don't know you!</h1>"
        end
  else puts "Error"
  end

client.close
end
