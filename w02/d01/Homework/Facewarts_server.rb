# FaceWarts

# So far we have established a root page and an about us page for the Hogwarts School of Witchcraft and Wizardry
# The problem is that at the moment, it doesn't include any info on its students
# Goal: To include student information on the Hogwarts' website
# Spec:
# Create 2 links from the home page, one for Gryffindor students and one for Slytherin students
# the routes should be /gryffindor and /slytherin
# These two pages should include a list of students belonging to each house (have a minimum of 2 students per house)
# If I click on a students name in the list, I should be taken to a profile page for that student, which should include a brief bio
# The routes for the students should be /STUDENT_NAME, except replace STUDENT_NAME with the name of the actual student
# Bonus:
# Include pictures of each student
# Incorporate a Google Font into your page
# Read the docs to figure out how
# Add any other pages and style elements that you find interesting



#this is called a server log

require 'socket'

server = TCPServer.new 2000

while true #a loop that will always stay open

client = server.accept #accept method, accepts a client's request to connect
client_ip = client.remote_address.ip_address

puts "Client has connected from #{client_ip}"

#Question = is there a way to dynamically populate the title tab using ruby?
#i googled it and saw a way using php....

# gryffindor_house = {harry_potter, ron_weasley}
# slytherin_house = {draco_malfoy, vincent_crabbe}



request = client.gets.chomp	#this is the content the browser is going to

# example path and how we would get to it: 
#request = "GET /cars HTTP/1.1"

request.split(" ")

path = request.split(" ")[1] #pulls the specific path they selected (which is after the main home page)

puts "Client #{client_ip} is attempting to reach #{path}"

if path == '/' #means if the path == root
	client.puts File.read('./views/index.html') #this tells it what file to read
	puts "Sent 'index.html' to #{client_ip}"#we sent this to the client  
elsif path == '/stylesheets/style.css' #you always have a / on a URL, it's just to separate/show subfolder
#means if the path is to the stylesheet - for browser / means folder where your website is index.html
	# client.puts File.read('../stylesheets/style.css') #old path from classwork
	client.puts File.read('./stylesheets/style.css') #new path - is this right b/c i dont have to go up a directory, right?
elsif path == "/about.html"
	client.puts File.read('./views/about.html')
	puts "Sent 'about.html' to #{client_ip}"
elsif path == "/gryffindor.html"
	client.puts File.read('./views/gryffindor.html')
	puts "Sent 'gryffindor. html' to #{client_ip}"
elsif path == "/slytherin.html"
	client.puts File.read('./views/slytherin.html')
	puts "Sent 'slytherin.html' to #{client_ip}"
elsif path == "gryffindor/harry_potter.html"
	client.puts File.read('./views/harry_potter.html')
	puts "Sent '/harry_potter.html' to #{client_ip}"
elsif path == "gryffindor/ron_weasley.html"
	client.puts File.read('./views/ron_weasley.html')
	puts "Sent '/ron_weasley.html' to #{client_ip}"
elsif path == "slytherin/draco_malfoy.html"
	client.puts File.read('./views/draco_malfoy.html')
	puts "Sent '/draco_malfoy.html' to #{client_ip}"
elsif path == "slytherin/vincent_crabbe.html"
	client.puts File.read('./views/vincent_crabbe.html')
	puts "Sent '/vincent_crabbe.html' to #{client_ip}"
else client.puts "Error. Try again."
	puts "sent error to client_ip"
end

#needs to be a file path withOUT a period in the if statement, 
#because thats how path will appear in the browser
#but we need a . client.puts File.read if we are going up a directory

puts "Client #{client_ip} has disconnected." #all these statements help us track and log 
#user interaction with the server

client.close

end

#note from class:

# 5:18 PM
# @NeelPatel Should the route for, say, Draco Malfoy be "/dracomalfoy" or "/slytherin/dracomalfoy"?
# Neel said, it should be the second one

