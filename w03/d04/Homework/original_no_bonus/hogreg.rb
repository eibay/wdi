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









# get '/students/show/:名' do
# 	name = request.path.split("/")[3]

# 	def check(name, ary_student)
# 		ary_student.each do |hash|
# 			if hash["名"] == name

# 			end
# 		end
# 	end
# 	a = check(name, ary_student)

# 		<h3> Name: <%= student_list[0]["名"] %> </h3>
# 		<h3> Age: <%= student_list[0]["岁"] %>  </h3>
# 		<h3> Spell: <%= student_list[0]["咒"] %>  </h3>


# 	erb(:students_show, locals: {student_list: ary_student, a: a})
# end







get '/students/show/:name' do
	name = request.path.split("/")[3]


	erb(:students_show, locals: {student_list: ary_student, name: name})
end


