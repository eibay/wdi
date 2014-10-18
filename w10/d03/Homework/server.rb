require 'pry'
require 'sinatra'
require 'json'
require 'httparty'
require_relative './lib/connection'
require_relative './lib/child'
require_relative './lib/book'
require_relative './lib/status'

after do 
	ActiveRecord::Base.connection.close
end

before do
	content_type :json
end

# Begin /books routes

get ("/books") do
	books = Book.all()
	books.to_json
end

get ("/books/:id") do
	book = Book.find(params[:id])
	book.to_json
end

get ("/books/:id/status") do
	book = Book.find(params[:id])
	if Status.all.find_by({book_id: params[:id]})
		"#{book["title"]} is unavailable."
	else
		"#{book["title"]} is available."
	end
end

post ("/books") do
	books = Book.create(book_params(params))
	books.to_json
end

put ("/books/:id") do
	content_type(:json)
	book = Book.find(params[:id])
	book.update(book_params(params))
	book.to_json
end

delete ("/books/:id") do
	books = Book.find(params[:id])
	books.destroy

	book.to_json
end
#End books routes

# Begin /children routes
get ("/children") do
	 children = Child.all()
	 children.to_json
end

get ("/children/:id") do
	child = Child.find(params[:id])
	child.to_json
end

get ("/children/:id/status") do
	child = Child.find(params[:id])
	status = child.statuses.to_json
	end

post ("/children") do
	children = Child.create(child_params(params))
	child.to_json
end

put ("/children/:id") do
	child = Child.find(params[:id])
	child.update(child_params(params))
end

delete ("/children/:id") do
	child = Child.find(params[:id])
	child.destroy

	child.to_json
end

# End /children routes

# Begin /status routes
get ("/status") do
	 status = Status.all()
	 status.to_json
end

get ("/status/:id") do
	status = Status.find(params[:id])
	status.to_json
end

post ("/status") do
	status = Status.create(status_params(params))
	status.to_json
end

put ("/status/:id") do
	status = Status.find(params[:id])
	status.update(status_params(params))
end

delete ("/status/:id") do
	status = Status.find(params[:id])
	status.destroy

	status.to_json
end

def book_params(params)
  params.slice(*Book.column_names)
end

def child_params(params)
  params.slice(*Child.column_names)
end

def status_params(params)
  params.slice(*Status.column_names)
end
