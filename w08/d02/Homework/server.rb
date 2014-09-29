require 'sinatra'
require_relative "./lib/connection"
require_relative "./lib/tshirt"
require_relative "./lib/order"


get '/' do 
  haml :index, {locals: {t_shirts: TShirt.all}} 
end 

get "/orders" do 
  t_shirt = TShirt.find_by_id params["tshirt_id"] 
  total_price = t_shirt.price.to_f *
  params["tshirt_quanity"].to_i 

  order = Order.new(
    tshirt_quanity: params["tshirt_quanity"],
         tshirt_id: params["tshirt_id"], 
             total: total_price
  )

  haml :order, {locals: {order: order, t_shirt: t_shirt}}
end 

post "/orders" do
  tshirt = TShirt.find_by_id params["tshirt_id"]
  updated_quanity = tshirt.available_quanity - params["tshirt_quanity"].to_i
  TShirt.update params["tshirt_id"], available_quanity: updated_quanity 
  order = Order.new( 
             email: params["email"], 
         tshirt_id: params["tshirt_id"], 
    tshirt_quanity: params["tshirt_quanity"], 
             total: params["total"]
  )

  order.save 

  haml :reciept, {locals: {order: order}}
end 