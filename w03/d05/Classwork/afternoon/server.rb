require 'json' #normally use to parse ruby hashes.
require 'sinatra'
require 'sinatra/reloader'
require 'pry'


get("/") do #complicated stuff
    students = JSON.parse(File.read('./students.txt'))
	erb(:index, { locals: { students: students }})
end

post("/students") do #complicated stuff
	first_name = params["first"]
	last_name = params["last"]
	email = parmas["email"]

	person = {"first" => first_name, "last" => last_name, "email" => email}

	# students is an array
	students = JSON.parse(File.read('./students.txt'))
    # add hash to array
	students.push(person)
    # convert students array to JSON
    students_json = JSON.generate(students)
    # take 2 args, file to write and what to write
	File.write('./students.txt', students_json)

	erb(:index, {locals: { students: students} })
end

get("/students") do #simple stuff
	erb(:students)
end

