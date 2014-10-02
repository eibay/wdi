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

  person = Person.create(person_hash)

  # person = Person.last
  person_json = person.to_json

end

get("/names") do

	names = Person.all()
	people = names.to_json

end

put("/edit") do 
  binding.pry
  person = Person.find_by(params["id"])

  person.name == params["name"]
  person.age == params["age"]

  person.save()

end






