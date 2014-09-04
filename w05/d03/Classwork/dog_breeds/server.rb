require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/breed'
require_relative './lib/image'

after do 
	ActiveRecord::Base.connection.close
end

get("/") do
	erb(:index, { locals: { images: Image.all(), breed: Breed.all(), breeds: Breed.all() } })
end


post("/") do
	# name = Breed.find_by({name: params["name"]})
	breed = Breed.new({name: params["name"]})
	breed.save

	api = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=c336a7aab28f2267ac26f04f350a9224&breed=#{breed.name}&animal=dog&output=basic&format=json")
	image = api["petfinder"]["pet"]["media"]["photos"]["photo"][1]["$t"]

	image_hash = {
		name: breed.name,
		image: image,
		breed_id: breed.id	
	}

	new_image = Image.create(image_hash)

	erb(:index, { locals: { images: Image.all(), breed: breed, breeds: Breed.all() } })

end

get("/:id/edit") do
	breed = Breed.find_by({id: params[:id]})

	erb(:edit, { locals: { breed: breed, breeds: Breed.all() } })
end

put("/breed/:id") do
	
	breed_hash = {
		name: params["name"],
		id: params["id"]
		# image: params["image"],
		# breed_id: params["breed_id"]
	}

	breed = Breed.find_by({id: params["id"]})
	image = Image.find_by({id: params["image"]})
	breed.update(breed_hash)

	erb(:index, { locals: { images: Image.all(), breed: breed, breeds: Breed.all() } })
end

delete("/:id")	do
	breed = Breed.find_by({id: params[:id]})
	breed.destroy

	erb(:index, { locals: { breed: breed, breeds: Breed.all() } })
end