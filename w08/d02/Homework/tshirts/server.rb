require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require_relative './lib/customer'
require_relative './lib/shirt'


get("/") do
  @shirts = Shirt.all()
  erb(:"index", { locals: { shirts: @shirts } })
end


get("/addashirt") do
  erb(:"addashirt", { locals: { shirts: Shirt.all(), } }) 
end

post("/customers") do
  character_hash = { 
    name: params["name"], 
    email: params["url"], 
    order_id: params["order_id"]
  }

  Customer.create(customer_hash)

  erb(:"customers/index", { locals: { customers: Order.all() } })
end