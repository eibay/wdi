require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require_relative './connection'
require_relative './models'

get("/books") do 
	books = Book.all
	books_json = books.to_json
	books_json
end

get("/books/:id") do 
	book = Book.find_by({id: params[:id]})
	book_json = book.to_json
	book_json
end

get("/books/:title") do 
	book = Book.find_by({title: params[:title]})
	borrowed_book = Borrowed_Book.find_by({title: params[:title]})

	books = Book.where(:title => params["title"])
	borrowed_books = Borrowed_book.where(:title => params["title"])

	if books.count > borrowed_books.count
		return "Yes we have that book available"
	else
		return "Sorry, all copies of that book are out"
	end

end

post("/books") do 
	book_hash = {
		title: params["title"],
		author: params["author"]
	}

	Book.create(book_hash)

	new_book = book_hash.to_json
	new_book
end


get("/users/:id/borrowed_books") do

	borrowed_books_by_user = User.find(params[:id]).borrowed_books
	borrowed_books_by_user.to_json

end





