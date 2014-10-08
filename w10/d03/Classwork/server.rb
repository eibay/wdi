require 'sinatra'
require 'json'
require_relative "lib/category"
require_relative "lib/client"
require_relative "lib/connection"
require_relative "lib/picture"
require_relative "lib/album"

get "/albums" do 
  Album.all.to_json  
end 

get "/albums/:id" do 
  Album.find_by_id(params[:id]).to_json 
end 

post "/albums" do 
  Album.create(request.body.read).to_json  
end 

put "/albums/:id" do 
  a = Album.find_by_id params[:id]  
  a.update({JSON.parse(request.body.read)}).to_json  
end 

delete "/albums/:id" do 
  a = Album.find_by_id params[:id] 
  a.destroy 
end 