require 'sinatra'
require 'pry'


student_info = []


# if you get to index by Submit Form on new_student page
post('/') do
	info = {}
	name = params["fullname"]
	age = params["age"]
	spell = params["spell"]
	info[:name] = name
	info[:age] = age
	info[:spell] = spell
	student_info << info
	erb(:index, { locals: { student_info: student_info }})
end

# if you get to index by link from any page (or root path)
get('/') do
#	student_names << params["fullname"]
	erb(:index, { locals: { student_info: student_info }})
end

# if you get to new_student form from link or URL
get('/students/new') do
	erb(:new_student)
end

# if you get to show_student from link or URL

# ********** yes, this part is messed up because we broke the keys and values and then ran out of time
get('/students/show') do
	 erb(:show_student, { locals: { fullname: name, student_info: student_info }})
end