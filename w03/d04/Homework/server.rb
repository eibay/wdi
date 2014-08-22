require 'sinatra'
require 'pry'


students= []

get('/students/new') do
	erb(:index)
end


post('/') do
	students.push params
	erb(:names, {locals: {name: students } } )
end

get('/students/show/:name') do
	erb(:specific_student, {locals: {name: students }})
end

get('/search') do
	erb(:search)
end


	