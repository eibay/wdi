require 'sinatra'
require 'pry'
require 'uri'

students = []

get('/students/new') do 
	erb(:signup_page)
end

post('/') do 
	student_info = {}

	name = URI.decode(params["name"].upcase)
	age = params["age"]
	spell = params["spell"].upcase

	student_info[:name] = name
	student_info[:age] = age
	student_info[:spell] = spell

	students << student_info

	erb(:main, {locals: { students: students }})
end

get('/') do 
	erb(:main, {locals: { students: students }})
end

get('/students/show/:hodor') do 

	name = URI.decode(request.path.split("/")[3])

	erb(:show_page, {locals: { students: students, name: name }})
end

get('/search') do 
	result = params["search"].upcase


	erb(:search_results, {locals: { students: students, result: result}})
end








