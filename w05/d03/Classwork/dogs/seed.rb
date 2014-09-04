require "httparty"
require_relative "./connection.rb"
require_relative "./breed.rb"
require_relative "./puppy.rb"

Puppy.create({
	breed: "Cavalier King Charles Spaniel",
	url: "http://photos.petfinder.com/photos/pets/29972531/1/?bust=1407476025&width=500&-x.jpg"
	})

Breed.delete_all

breeds_array = []
http_response =  HTTParty.get("http://api.petfinder.com/breed.list?key=31bbb0853c9d2dcc3946a50192220611&animal=dog&format=json")
responses = http_response["petfinder"]["breeds"]["breed"]

responses.each do |response|
	breeds_array <<response["$t"]
end

breeds_array.each do |breed|
	Breed.create({
		name: breed
		})
end