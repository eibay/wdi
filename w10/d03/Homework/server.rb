require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './connection'
require_relative './models'


after do
  ActiveRecord::Base.connection.close
end

get "/books" do
   binding.pry
  Book.all.to_json
end

get "/books/:id" do
  Book.find(params["id"]).to_json
end

post "/books" do
   # binding.pry
  new_book = {
    title: "Lord of the Flies"
  }

  Book.create(new_book)

end

put '/books/:id' do
  #binding.pry
  book = Book.find(params["id"])
  book.title = "To Kill a Mockinbird"
  book.save
end

delete '/books/:id' do
  binding.pry
  book = Book.find(params["id"])
  book.destroy
end

##################################

get "/children" do
  Child.all.to_json
end

get "/children/:id" do
  Child.find(params["id"]).to_json
end

post "/children" do
  new_child = {
    title: "Insert Child name here"
  }

  Child.create(new_child)

end

put '/children/:id' do
  child = Child.find(params["id"])
  child.name = "Insert Child name here again"
  child.save
end

delete '/children/:id' do
  child = Child.find(params["id"])
  child.destroy
end

##################################

get "books/borrowedbooks" do
  BorrowedBook.all.to_json
end

get "/borrowedbooks/:id" do
  BorrowedBook.find(params["id"]).to_json
end

post "/borrowedbook" do
  new_borrowed_book = {
    title: "Book name"
  }

   BorrowedBook.create(new_borrowed_book)

end

delete '/borrowedbooks/:id' do
  borrowedbook = BorrowedBook.find(params["id"])
  borrowedbook.destroy
end