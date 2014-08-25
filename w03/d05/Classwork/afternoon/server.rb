require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'




get("/") do
	students = JSON.parse(File.read('./students.txt'))
	erb(:index)
end


post("/students") do
	first_name = params["first"]
	last_name = params["last"]
	email = params["email"]
  
	person = {"first" => first_name, "last" => last_name, "email" => email}

	students = JSON.parse(File.read("./students.txt"))

	students << person
	students_json = JSON.generate(students)

	File.write('./students.txt', students_json)

	erb(:index, {locals: {students: students}})
end

get("/students") do

	erb(:students)
end













# server = TCPServer.new 2000

# while true
# 	client = server.accept
# 	request = client.gets
# 	path = request.split(" ")[1]

# 	if path == "/"

# 	end


# 	if path == "/other"

# 	end

# 	client.close




# end