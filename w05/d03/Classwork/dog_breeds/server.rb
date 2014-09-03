require 'sinatra'
relative_require "./lib/dog"
relative_require "./lib/config"

get '/' do 
	erb :main, {locals: {dogs: Dog.all}}
end 

get "/dogs/:id" do 

end 

delete "/dogs/:id" do 

end 