require 'sinatra'
require_relative "lib/category"
require_relative "lib/client"
require_relative "lib/connection"
require_relative "lib/picture"
require_relative "lib/album"

get "/albums" do 
  Album.all 
end 

get "/albums/:id" do 
  Album.find_by_id params[:id]
end 

post "/albums" do 
  Album.create params
end 

put "/albums/:id" do 
  a = Album.find_by_id params[:id]  
  a.update { params } 
end 

delete "/albums/:id" do 
  a = Album.find_by_id params[:id] 
  a.destroy 
end 