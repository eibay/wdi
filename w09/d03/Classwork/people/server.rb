require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require_relative './lib/connection'
require_relative './lib/person'

after do
  ActiveRecord::Base.connection.close
end

get('/') do
  send_file './views/index.html'
end

get('/first') do
	people = Person.all
	people.to_json
end

put('/edit') do
	people = Person.all
	people.to_json
end

post('/create') do
	person_hash = {
		name: params["name"],
		age: params["age"]
	}

	newPerson = Person.create(person_hash)

	newPerson.to_json

end

