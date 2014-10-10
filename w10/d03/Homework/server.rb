require 'sinatra'

# all the things 

get "/books" do
  Book.all.to_json  
end 

get "/patrons" do 
  Patron.all.to_json 
end 

# make something 

post "/books" do
  data = request.body.read 
  Book.create(data).to_json 
end 

post "/patrons" do 
  data = request.body.read 
  Book.create(data).to_json 
end 

# some things 

get "/books/:id" do
  Book.find_by_id(params[:id]).to_json
end 

get "/patrons/:id" do 
  Book.find_by_id(params[:id]).to_json 
end 

puts "/books/:id" do
  data = request.body.read 
  b = Book.find_by_id params[:id] 
  b.update(data).to_json 
end 

delete "/books/:id" do 
  Book.destroy(params[:id]).to_json 
end 

delete "/patrons/:id" do 
  Parton.destroy(params[:id]).to_json
end 

# your experience 

get "/patrons/:id/books" do 
  Books.where(:patron_id, params[:id]).to_json  
end 
