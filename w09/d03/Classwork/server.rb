require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require_relative './lib/connection'
require_relative './lib/person'


get("/") do

	File.read("./views/index.html")

end

post("/create") do

person_hash = {
  name: params["name"],
  age: params["age"]
}

  Person.create(person_hash)

  person = Person.last
  person_json = person.to_json

end

get("/names") do

	names = Person.all()
	people = names.to_json

end

put("/editname/:id") do 
  person = Person.find_by({id: params["id"]})

  person.save()

end






