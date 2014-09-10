require 'sinatra'
require 'sinatra/reloader'
require_relative './libs/connection'
require_relative './libs/Dog_class'
require 'pry'


after do 
	ActiveRecord::Base.connection.close
end 

get("/") do 
	erb(:index, { locals: {dog_breed: Dog.all }})
end 

post("/") do 
	dog_hash = {
	name: params["name"],
	breed: params["breed"],
	age: params["age"]
}

	Dog.create(dog_hash)
	redirect"/"
end

delete("/dog/:id") do 
	dog = Dog.find_by({id: params[:id]})
	dog.destroy

	redirect"/"
end 

get("/dog/:id/edit") do 
	dog = Dog.find_by({id: params[:id]})

	erb(:edit, {locals: { dog: dog }})

end 

put("/dog/:id") do 
	
	dog_hash = {
		name: params["name"],
		breed: params["breed"],
		age: params["age"]
	}
	dog = Dog.find_by(id: params[:id])
	
	dog.update(dog_hash)
	binding.pry

	redirect"/"
end





