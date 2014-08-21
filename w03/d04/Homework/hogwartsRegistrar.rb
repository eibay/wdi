require 'sinatra'
require 'pry'

students=""
student_profile={}

get '/' do
	erb(:index, {locals: {students: students} })
end


get '/students/new' do
	erb(:new)
end

post '/students/new' do
	name= params["name"]
	name= name.downcase
	age = params["age"]
	spell= params["spell"]

	students += "<li><a href='/students/show/#{name}'>#{name}</a></li>"

	
	student_profile["#{name.downcase}"] = "Name: #{name}; Age: #{age}; Favorite Spell: #{spell}"
	erb(:index, {locals: {students: students} })

end


get '/students/show/:name' do
	
	name = request.path_info.split('/')[3] 
	name = name.gsub("%20", ' ')
	erb(:show, {locals: {profile: student_profile[name]}})
end


get '/students/search' do
	erb(:search)	
end

get '/students/list' do
	
	name = params["name"]
	name = name.downcase
	
	if student_profile.include?(name)
		erb(:list, {locals: {students: student_profile[name]}})
	else
		erb(:notAvailable)
	end

end







