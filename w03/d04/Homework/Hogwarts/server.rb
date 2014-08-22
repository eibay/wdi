require 'sinatra'
require 'pry'

registered_students = [] #array of hashes


get("/students/new") do
	erb(:reg_form)
end

post("/") do
	registered_stud = params
	registered_students.push(registered_stud)
	erb(:index, { locals: { registered_students: registered_students } })
end

get("/students/show/:") do
	specific_stud = params
	erb(:specific_student, { locals: { specific_stud: specific_stud } })
end

get("/search") do
	erb(:info, { locals: { information: params["input"] } })
end


    	

    