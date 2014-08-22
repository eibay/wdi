require 'sinatra'
require 'pry'


ary_student = []
get '/' do
	erb(:index, {locals: {student_list: ary_student}})
end


post '/' do
	hash = {}
	name = params["名"]
	age = params["岁"]
	spell = params["咒"]

	hash["名"] = name
	hash["岁"] = age
	hash["咒"] = spell

	ary_student << hash

	erb(:index, {locals: {student_list: ary_student}})
end



get '/search' do

	erb(:search, {locals: {student_list: ary_student}})
end



get '/students/new' do

	erb(:students_new)
end



post '/sort' do
	house = rand(4)
	case house
	when 0
		house = "Gryffindor"
	when 1
		house = "Ravenclaw"
	when 2
		house = "Hufflepuff"
	when 3
		house = "Slytherin"
	end

	ary_student.each do |hash|
		if params["sorted_student"] == hash["名"]
			hash["House"] = house
		end
	end
	# binding.pry
	erb(:index, {locals: {student_list: ary_student}})
end


get '/students/show/:name' do
	name = request.path.split("/")[3]
	erb(:students_show, {locals: {student_list: ary_student, name: name}})
end


# get '/houses' do
# 	erb(:houses, {locals: {student_list: ary_student}})
# end

get '/houses/:house_name' do
	house_name = request.path.split("/")[2]
	# binding.pry
	erb(:houses, {locals: {student_list: ary_student, house_name: house_name}})
end


