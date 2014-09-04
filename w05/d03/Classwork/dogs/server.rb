require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/dog'

after do
	ActiveRecord::Base.connection.close
end

get("/") do
	erb(:index, { locals: { dogs: Dog.all(), } })
end

post("/breeds") do
	new_breed_hash = { 
      breed_name: params["breed_name"], 
      # pic_url: #Api call, 
	}

	Dog.create(new_breed_hash)

	erb(:index, { locals: { dogs: Dog.all(), } })
end

put("/breeds/edit") do
	new_breed_hash = { 
      breed_name: params["breed_name"], 
      # pic_url: #Api call, 
	}

	dog = Dog.find_by({id: params[:id]})
  	dog.update(new_breed_hash)

	erb(:breed_edit, { locals: { dogs: Dog.all(), } })
end

delete("/breeds/:id") do
	dog = Dog.find_by({id: params[:id]})
	dog.destroy

	erb(:index, { locals: { dogs: Dog.all(), } })
end




