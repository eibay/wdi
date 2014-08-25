require 'json'
require 'sinatra'
require 'pry'



get("/") do
  students = JSON.parse(File.read('./students.txt'))
  erb(:index, {locals: { students: students} })
end


post("/students") do
  first_name = params["first"]
  last_name = params["last"]
  email = params["email"]
  #sinatra will work if u mamke it symbol
  person = {"first" => first_name, "last" => last_name, "email" => email}
  #students is an array like we normally do
  students = JSON.parse(File.read('./students.txt'))
  #now an array getting array from text file
  students << person
  File.write('./students.txt', students.to_json)
  #or can to students json.generate(students)
  #only cause we require json
  erb(:index, {locals: {students: students}})
  # can make it read any file just loaded up index sheet
end

get("/students") do
  erb(:students)
end
#gets us to the page in browswer
