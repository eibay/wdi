require 'sinatra'
require_relative "./lib/breed"
require_relative "./lib/config"

get '/' do 
	erb :main, {locals: {breeds: Breed.all}}
end 

get "/breeds/:id" do 

end 

post "/breeds" do
	Breed.new({ 
		   name: params["name"], 
	description: params["description"]
	}).save 

	redirect '/'
end 

delete "/breeds/:id" do
	# now we have to put Fritz to sleep, Clayton # 
	Breed.find_by({id: params[:id]}).destroy

	redirect '/'
end 