require 'sinatra'
require 'pry'
require 'uri'

student_profiles = []
empty_profile = [{name: "None", age: "0", spell: "Evanesco"}]

get("/") do
	if student_profiles.length > 0 
		erb(:index, {locals: {student_profiles: student_profiles}})
	else
		erb(:index, {locals: {student_profiles: empty_profile}})
	end
end

post("/") do 
	student_profile = {}
	student_profile[:name] = params["name"]
	student_profile[:age] = params["age"]
	student_profile[:spell] = params["spell"]
	student_profiles << student_profile
	erb(:index, {locals: {student_profiles: student_profiles}})
end

get("/students/new") do
	erb(:new_students_form)
end

get("/students/show/:name")  do 
	selected_student = {}
	
	student_profiles.each do |stud|
		if stud[:name] == params[:name]
			selected_student[:name] = stud[:name]
			selected_student[:age] = stud[:age]
			selected_student[:spell] = stud[:spell]
		end
	end
erb(:student_page, {locals: {name: selected_student[:name], age: selected_student[:age], spell: selected_student[:spell]}})
end

get("/search") do
	erb(:search_page)
end

get("/search_result") do
	name_answer = {}
	n = 0
	while n < student_profiles.length	
		if student_profiles[n][:name] != params["query_name"]
			name_answer[:name] = params["query_name"]
			name_answer[:answer] = "is not"
			n += 1
		else
			name_answer[:name] = params["query_name"]
			name_answer[:answer] = "is"
			break
		end
	end
	erb(:search_result_page, {locals: {name: name_answer[:name], answer: name_answer[:answer]}})
end



