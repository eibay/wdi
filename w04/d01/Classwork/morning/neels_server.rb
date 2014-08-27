# Goal = to make some parts of this server/program modular (by wrapping code in methods)

require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get("/") do
	students = JSON.parse(File.read('./students.txt'))

	erb(:index, { locals: { students: students} })
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



# creating a method to get new student info and write it to the persistant txt document


post("/students") do

  # i originally put the method here, but actually should put them OUTSIDE the loop, so that we can access them more universally

  #   def add_new_person(params)
  #     first_name = params["first"]
  #     last_name = params["last"]
  #     email = params["email"]
  #     person = {"first" => first_name, "last" => last_name, "email" => email}
  #   end


  # def update_db(person, d_base)
  #     # d_base is an array
  #     d_base = JSON.parse(File.read('./d_base.txt'))
  #     # add hash to array
  #     d_base.push(person)
  #     # convert students array to JSON
  #     d_base_json = JSON.generate(d_base)
  #     # takes 2 args, file to write and what to write
  #     File.write('./d_base.txt', d_base_json)
  #   ]
  # end

      

  erb(:index, {locals: { students: students } })
end





get("/students") do
	erb(:students)
end

get("/students/:first_name") do 
  students = JSON.parse(File.read('./students.txt'))
  # result is the return value of .find
  result = students.find do |student|
    student["first"].downcase == params[:first_name].downcase
  end
  # binding.pry

  erb(:student, { locals: { student: result} })
end












