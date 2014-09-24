require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require_relative './lib/connection.rb'
require_relative './shirt.rb'

after do
	ActiveRecord::Base.connection.close
end

get ("/") do 
	shirts = Shirt.all();
	erb(:index, {locals: {shirts: shirts} })
end

get ("/admin") do
	erb(:admin)
end

post ("/add_shirt") do 
	tShirt_hash = {
		name: params["name"], 
		quantity: params["quantity"].to_i, 
		price: params["price"].to_i, 
		img_url: params["img_url"] 
		}
	
	shirt = Shirt.new(tShirt_hash)
	shirt.save

	redirect request.referrer
end

put ("/order") do 


end