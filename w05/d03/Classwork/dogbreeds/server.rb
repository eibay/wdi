require "pry"
require "uri"
require "httparty"
require "sinatra"
require "sinatra/reloader"
require_relative "./connection"
require_relative "./breed"

ActiveRecord::Base.logger = Logger.new(STDOUT)

after do
	ActiveRecord::Base.connection.close
end

get "/" do
	erb(:index, { locals: {breeds: Breed.all} })
end

post "/breeds" do
	search_term = URI.encode(params["name"])
	response = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=5a05c4518c406f394cc14bfbfb239214&animal=dog&breed=#{search_term}&output=basic&format=json")
	img_url = response["petfinder"]["pet"]["media"]["photos"]["photo"][2]["$t"]
	Breed.create( {name: params["name"], img_url: img_url} )
	redirect "/"
end

get "/breeds/:id" do
	erb(:edit, { locals: { breed: Breed.find_by( { id: params["id"] } ) } })
end

delete "/breeds/:id" do
	Breed.find_by( { id: params["id"] } ).destroy
	redirect "/"
end

put "/breeds/:id" do
	search_term = URI.encode(params["name"])
	breed = Breed.find_by( { id: params["id"] } )
	response = HTTParty.get("http://api.petfinder.com/pet.getRandom?key=5a05c4518c406f394cc14bfbfb239214&animal=dog&breed=#{search_term}&output=basic&format=json")
	img_url = response["petfinder"]["pet"]["media"]["photos"]["photo"][2]["$t"]
	breed.update ( {name: params["name"], img_url: img_url} )
	redirect "/"
end