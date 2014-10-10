require 'sinatra'
require 'sinatra/reloader'
require 'date'
require_relative './db/connection'
require_relative './lib/album'
require_relative './lib/category'
require_relative './lib/client'
require_relative './lib/photo'
require 'httparty'
require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get "/books" do 
	Book.all.to_json
end

get "/books/:id" do
	Book.find(params["id"]).to_json 
end

post "/books" do 
	new_book = {
		title: "The Lord of the Rings"
	}

	Book.create(new_book)
end

put "/books/:id" do
	book = Book.find(params["id"])
	book.title = "Something"
end

delete("/books/:id") do 
	book = Book.find(params["id"])
	book.destroy
end

get "/children" do 
	Child.all.to_json
end

get "/children/:id" do
	Child.find(params["id"]).to_json 
end

post "/children" do 
	new_child = {
		name: "Aragorn"
	}

	Child.create(new_book)
end

put "/children/:id" do
	child = Child.find(params["id"])
	child.name = "Gandalf"
end

delete("/children/:id") do 
	child = Child.find(params["id"])
	child.destroy
end

get ("/children/:id/borrowed-books")
	child = Child.find(params["id"])
	books_borrowed = child.borrowed_books.to_json
end

get "/borrowedbooks" do 
	Borrowedbook.all.to_json
end

post "/borrowedbooks/:book-id/:child-id" do 
	book = Book.find(params["id"])
	book.borrowed = true
	book.save

	borrowed_book = {book_id: params["book-id"], child_id: params["child-id"]}
	Borrowedbook.create(borrowed_book)
end

delete("/borrowedbooks/:book-id") do 
	borrowed_book = Borrowedbook.find(params["book-id"])
	borrowed_book.destroy

	book = Book.find(params["book-id"])
	book.borrowed = false
	book.save
end








