require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

  def add_students(file_to_edit)
    first_name = params["first"]  
    last_name = params["last"]
    email = params["email"]

    person = {"first" => first_name, "last" => last_name, "email" => email}

    # students is an array
    students = JSON.parse(File.read(file_to_edit))
    # add hash to array
    students.push(person)
    # convert students array to JSON
    students_json = JSON.generate(students)
    # takes 2 args, file to write and what to write
    File.write(file_to_edit, students_json)
  end


  def search_by(key, param)
    students = JSON.parse(File.read('./students.txt'))
    result = students.find do |student|
      student[key].downcase == params[param].downcase
    end
    return result
  end




get("/") do
	students = JSON.parse(File.read('./students.txt'))
	erb(:index, { locals: { students: students} })
end


post("/students") do
  add_students('./students.txt')
  erb(:index, {locals: { students: students } })
end

get("/students") do
	erb(:students)
end



get "/students/:first_name" do
  result = search_by("first", "first_name")

  erb(:student, {locals: {result: result}})
end

get "/students/:last_name" do
  result = search_by("last", "last_name")
  binding.pry
  erb(:student, {locals: {result: result}})
end

get "/students/:email" do
  result = search_by("email", "email")
  erb(:student, {locals: {result: result}})  
end
