require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './connection.rb'
require_relative './models.rb'

after do
  ActiveRecord::Base.connection.close
end

get "/books" do
  books = Book.all().to_json
end

get "/books/:id" do
  book = Book.find(params[:id]).to_json
end

post "/books" do
  book = {
    name: params[:name]
  }
  Book.create(book)
end

delete "/books/:id" do
  book = Book.find(params[:id])
  book.destroy
end


get "/people" do
  people = Person.all().to_json
end

get "/people/:id" do
  person = Person.find(params[:id]).to_json
end

post "/people" do
  person = {
    name: params[:name]
    phone_number: params[:number]
  }
  Person.create(person)
end

delete "/people/:id" do
  person = People.find(params[:id])
  person.destroy
end

get "/borrows" do
  borrows = Borrow.all().to_json
end

get "/borrows/:id" do
  borrow = Borrow.find(params[:id]).to_json
end

post "/borrows" do
  borrow = {
    person_id: params[:person_id],
    borrowed_date: params[:borrowed_date],
    book_id: params[:book_id]
  }
  Borrow.create(borrow)
end

delete "/books/:id" do
  borrow = Borrow.find(params[:id])
  borrow.destroy
end

get "/person/:id/borrows" do
  person = People.find(params[:id])
  borrows= person.borrows.to_json
end

