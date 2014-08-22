require 'sinatra'

registered_students = []


get("/") do
	erb(:index)

end

Post("/") do
	registered_students << params["fullinfo"]
	erb(:hogreg, { locals: {registered_students: registered_students}})
	
end