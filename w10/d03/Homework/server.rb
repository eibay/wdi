require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'json'

require_relative './models.rb'
require_relative './connection.rb'

after do
  ActiveRecord::Base.connection.close
end

before do
  content_type :json
end

get "/books" do 
	Book.all.to_json
end

get "/books/:id" do 
	book = Book.all.find_by(id: params[:id]).to_json
end

post "/books" do 
	book = Book.create(book_params(params))

	book.to_json
end

put("/books/:id") do
	book = Book.find(params[:id])
	book.update(book_params(params))

	book.to_json
end

delete "/books/:id" do
	book = Book.find(params[:id])
	book.destroy
	
	book.to_json
end



get "/children" do
	Child.all.to_json
end

get "/children/:id" do
	child= Child.all.find_by(id: params[:id]).to_json
end

post "/children" do 
	child = Child.create(child_params(params))
	
	child.to_json
end

put("/children/:id") do
	child = Child.find(params[:id])
	child.update(child_params(params))
	
	child.to_json
end

delete "/children/:id" do
	child = Child.find(params[:id])
	child.destroy
	
	child.to_json
end



get "/borrowedbooks" do
	Borrowedbook.all.to_json
end

get "/borrowedbooks/:id" do
	borrowedbook = Borrowedbook.all.find_by(id: params[:id]).to_json
end

post "/borrowedbooks" do 
	borrowedbook= Borrowedbook.create(borrowed_params(params))

	borrowedbook.to_json
end

put("/borrowedbooks/:id") do
	borrowedbook = Borrowedbook.find(params[:id])
	borrowedbook.update(book_params(params))

	borrowedbook.to_json
end

delete "/borrowedbooks/:id" do
	borrowedbook = Borrowedbook.find(params[:id])
	borrowedbook.destroy
	
	borrowedbook.to_json
end
