require 'sinatra'

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