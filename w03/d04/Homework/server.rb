require 'sinatra'
require 'pry'

registrant_names = []
full_profiles = []

get ("/students/new") do 
	erb(:register)	
end

post ("/") do

	name = params["student_name"]
	age = params["age"]
	favorite_spell = params["favorite_spell"]

	profile = { student_name: name, age: age, favorite_spell: favorite_spell }
	
	registrant_names.push(name)
	
	full_profiles.push(profile)

	erb(:index, { locals: { registrant_names: registrant_names } })
end

get ("/students/show/") do

	# while full_profiles[0][:student_name] == registrant_names[0]
	# client.puts File.read('./views/profile.erb')
	# end

	erb(:profile, { locals: { full_profiles: full_profiles } })
end

get ("/search") do
	erb(:search)

	# if registrant_names.includes?(name) do
	# 	erb(:profile)
	# end
	
end