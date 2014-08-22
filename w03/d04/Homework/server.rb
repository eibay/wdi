require 'sinatra'
require 'pry'

registered_students = []


Post('/') do
	name = params["name"]
	age = params["age"]
	spell = params["spell"]
	registered_students << params["fullinfo"]
	erb(:hogreg, { locals: {registered_students: registered_students}})
	
end


get('/') do
	erb(:index { locals: { registered_students: registered_students}})

end

