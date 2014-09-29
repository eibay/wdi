require "pry"
require "sinatra"
require "sinatra/reloader"
require_relative "lib/connection.rb"
require_relative "lib/order.rb"
require_relative "lib/tshirt.rb"
require_relative "lib/user.rb"

after do
	ActiveRecord::Base.connection.close
end

get("/") do
	tshirts = Tshirt.all 
	erb(:index, {locals: {tshirts: tshirts}})
end

get("/tshirts/:id") do
	tshirt = Tshirt.find_by(id: params[:id])
	erb(:show, {locals: {tshirt: tshirt}})
end

post("tshirt/:id") do
	
end