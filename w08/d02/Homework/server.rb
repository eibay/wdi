require 'sinatra'
require_relative "./lib/connection"
require_relative "./lib/tshirt"
require_relative "./lib/order"


get '/' do 
  haml :index, {locals: {t_shirts: TShirt.all}} 
end 