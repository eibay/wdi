require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/customer'
require_relative './lib/tshirt'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:"/tshirts/index", {locals: {tshirts: Tshirt.all() }})
end

get("/tshirts/buy") do
  erb(:"tshirts/new", {locals: {customers: Customer.all() }})
end

post("/tshirts/buy") do
  tshirt_hash = {
    size: params["size"],
    price: params["price"],
    qty: params["qty"],
    image_url: params["image_url"],
    cust_id: params["cust_id"]
  }

  Tshirt.create(tshirt_hash)

  erb(:"tshirts/index", {locals: {tshirts: Tshirt.all() }})
end

get("/tshirts/:id") do
  tshirt = Tshirt.find_by({id: params[:id]})
  erb(:"customers/show", {locals: {customer: customer}})
end

post("/confirmation") do
  erb(:"tshirts/confirmation")
end

########################

get("/customers") do
  erb(:"customers/index", {locals: {customers: Customer.all() }})
end

post("/customers") do

  customer_hash = {

      name: params["name"],
      email: params["email"]
  }

  Customer.create(customer_hash)

  erb(:"customers/index", {locals: {customers: Customer.all() }})
end

get("/customers/new") do
  erb(:"customers/new", {locals: {customers: Customer.all() }})
end

get("/customers/:id") do
  customer = Customer.find_by({id: params[:id]})

  erb(:"customers/show", {locals: {customer: customer }})
end





