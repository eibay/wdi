require 'sinatra'
require 'pry'

post '/students/new' do
	erb(:regform)
end

get '/' do
	erb(:index, {locals: {students: students} })
end

get '/students/show' do
	student = params["student"]
	
	on_file = "Student not on file!"
	files = students.split(",")
		files.each do |file| 
		name = "#{file.split(" ")[0]} #{file.split(" ")[1]}" 
		
		if name == student
			index = files.index(file) 
			on_file = files[index]
		end
	end
	erb(:show, { locals: { on_file: on_file } })
end


get '/search' do
	erb(:search {locals: {on_file: on_file}})

end











	name = params["name"]
	age = params["age"]
	favorite_spell = params["favorite_spell"]
	person = { name: name, age:age, favorite_spell:favorite_spell}
	information.push(person)
	erb(:regform, { locals: {information:information} })
end

get '/students/show' do
	
end
	

get '/search' do
	erb(:search)
end

