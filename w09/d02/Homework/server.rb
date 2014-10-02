require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'active_record'
require 'pry'

# ActiveRecord::Base.establish_connection({
#   :adapter => "postgresql",
#   :host => "localhost",
#   :username => "jeffcampomanes",
#   :database => "grocery"
# })

# ActiveRecord::Base.logger = Logger.new(STDOUT)

# class Grocery < ActiveRecord::Base
# end

# after do
#   ActiveRecord::Base.connection.close
# end

# get("/") do 
# 	groceries = Grocery.all()
# 	erb(:index, {locals: { items: item}})
# end

get("/") do 
	erb(:index)
end


# post '/add' do
# 	new_item = params['item']
# 	new_item_hash = {
# 		item: new_item
# 	}
# 	Grocery.create(new_item_hash)

# 	new_item_id = Grocery.all().last[:id]
# 	response = {id: new_item_id}
# 	response.to_json
# end 

