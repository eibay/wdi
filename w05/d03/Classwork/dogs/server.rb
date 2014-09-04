
# create a main page to add and list current breeds

# On your main page should be a form to submit 
# a new breed of dog
# This main page should also list current breeds 
# of dogs in the database
# deleting breeds

# Next to each breed of dog add a button that when 
# clicked deletes that breed of dog and returns to the main page
# editing breeds

# Next to each breed of dog should be an edit 
# button that take you to an edit page
# On the edit page the user can submit a modified 
# name for that breed. Once submitted they should 
# return to the main page









require "sinatra"
require "sinatra/reloader"
require "httparty"
require "uri"
require_relative "./connection.rb"
require_relative "./puppy.rb"
require_relative "./breed.rb"

after do
	ActiveRecord::Base.connection.close
end


get("/") do 
	erb(:index, {locals: {puppies: Puppy.all, breeds: Breed.all}})
end

post("/") do
breed = params["breed"]
uri_breed = URI.encode(breed)
response = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=31bbb0853c9d2dcc3946a50192220611&breed=#{uri_breed}&animal=dog&output=full&format=json")
url = response["petfinder"]["pet"]["media"]["photos"]["photo"][2]["$t"]
	Puppy.create({
		breed: breed,
		url: url
		})
	erb(:index, {locals: {puppies: Puppy.all, breeds: Breed.all}})
end

delete("/") do
	puppy = Puppy.find_by({id: params["id"]})
	puppy.destroy

	redirect "/"
end

get("/edit/:id") do
	puppy = Puppy.find_by({id: params[:id]})
	erb(:edit, {locals: {puppy: puppy}})
end

put("/") do
	puppy = Puppy.find_by({id: params["id"]})

	puppy.update({breed: params["breed"], url: params["url"]})

	redirect "/"
end


