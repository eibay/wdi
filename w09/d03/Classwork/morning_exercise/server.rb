require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "./lib/connection.rb"
require_relative "./lib/person.rb"

after do 
	ActiveRecord::Base.connection.close
end

get("/") do
	send_file File.join(settings.public_folder, 'index.html')
end

post("/create") do
	new_person = {age: params["age"], name: params["name"]}
	Person.create(new_person)
	new_person.to_json
end

get("/view_all") do
	Person.all.to_json
end
