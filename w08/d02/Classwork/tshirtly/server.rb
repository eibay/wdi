require "pry"
require "sinatra"
require "sinatra/reloader"
require "json"
require_relative "./lib/shirt"
require_relative "./lib/order"
require_relative "./connection"

after do
  ActiveRecord::Base.connection.close
end

get "/" do

	erb(:index, {locals: {shirts: Shirt.order(:id)} })

end

get "/admin" do

	erb(:admin, { locals: { shirts: Shirt.all } })

end

post "/order" do
	content_type :json
	order = JSON.parse(request.body.string)
	Order.create(order)
end

put "/quantity" do
	binding.pry
end