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
	people_hash = {
		name: params["name"],
		age: params["age"].to_i,
		id: params["id"].to_i
	}

	person = Person.find_by({id: params[:id]})
	person.update(people_hash)
	person.to_json

# binding.pry
end	