require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'



get("/") do
	students = JSON.parse(File.read('./students.txt'))

	erb(:index1, { locals: { students: students} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]

  person = {"first" => first_name, "last" => last_name, "email" => email}

  # students is an array
  students = JSON.parse(File.read('./students.txt'))
  # add hash to array
  students.push(person)
  # convert students array to JSON
  students_json = JSON.generate(students)
  # takes 2 args, file to write and what to write
  File.write('./students.txt', students_json)

  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end

get("/students/:firstname") do
#makes it dynamic :name that tells the server to look for any path with /students/
#getting it from url
students = JSON.parse(File.read("./students.txt"))
#have to put in here otherwise it will not add to it, it won't let it 
#dynamically would work in TCP but not sinatra because TCP it will run every line
#because we are not looping in sinatra, it is doing it for us
#in sinatra we have to put stuff in the get end statements
#only if adding not if only reading it 
result = students.find do |student| #can set find to a variable
student["first"].downcase = params[:firstname].downcase
#have to set varible this way
#as soon as finds the first value it leaves 
#only is looking for not false
#will search in a array of hashes and if true,give you the hash 
#seeing if any value of "first" in the array equals what is put into the url
end
#checking value of first
erb(:student, {locals: {result: result}})
end

















