require 'sinatra'
require 'pry'

registered_students = [] #array of hashes


get("/") do
  erb(:index)
end

get("/students/new") do
	erb(:reg_form)
end

post("/students/registered_student") do
	registered_stud = params
	registered_students.push(registered_stud)
	erb(:other, { locals: { registered_students: registered_students } })
end

get("/students/show") do
	erb(:info, { locals: { information: params["demo_form"] } })
end

get("/search") do
	erb(:info, { locals: { information: params["input"] } })
end


    	

    	