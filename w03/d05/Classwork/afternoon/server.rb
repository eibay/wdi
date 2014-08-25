require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do
	students = JSON.parse(File.read('./students.txt'))
	erb(:index, locals: {students: students})
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}
# students is an array because [] is in the txt file
students = JSON.parse(File.read('./students.txt'))

students.push(person)

File.write('./students.txt', students.to_json) #alternative is var = JSON.generate(students)
erb(:index, locals: {students: students})
end

get("/students") do
	erb(:students)
end

