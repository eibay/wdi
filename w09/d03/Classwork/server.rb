require 'pry'
require 'sinatra'
require 'json'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/person'

after do
	ActiveRecord::Base.connection.close
end

get ('/') do
File.read('./views/index.html')
# send_file './views/index.html'
end

get ('/people') do
	people = Person.all()
	people.to_json
	end

post ('/create') do
	people_hash = {
		name: params["name"],
		age: params["age"]
	}

	new_person = Person.create(people_hash)
	new_person.to_json

# binding.pry
end

put ('/edit') do
	content_type :json
	people_hash = {
		name: params["name"],
		age: params["age"].to_i,
		id: params["id"]
	}
	person = Person.find_by({id: params[:id]})
	person.update(people_hash)
	# binding.pry
	person.to_json

end	

delete ("/delete") do
	content_type :json
	person = Person.find_by({id: params[:id]})
	# binding.pry
	person.destroy
end