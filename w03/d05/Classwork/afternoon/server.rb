require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do
  students = JSON.parse(File.read("./students.txt"))

  erb(:index, locals: {students: students }})
end




post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  students = JSON.parse(File.read("./students.txt"))

  students.push(person)

  # students was a string in the txt file and JSON parses it into an array and then we push person
  # into it.

  File.write("./students.txt", students.to_json) #the file u wanna write, what u actually wanna write

  erb(:index, {locals: {students:, students }})
  #binding.pry
end




get("/students") do
  erb(:students)
end

#get students just shows the form and post students actually makes a change to the form.

#The students that are being added are shown on the index page.
