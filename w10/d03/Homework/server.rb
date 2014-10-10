require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'httparty'
require 'active_record'
require_relative('./lib/connection')
require_relative('./lib/books')
require_relative('./lib/children')
require_relative('./lib/borrowedBooks')

after do
	ActiveRecord::Base.connection.close
end

before do
	content_type :json
end

get('/books') do
	books = Book.all
	borrowed = BorrowedBook.all
	
	borrowed_books = []
	borrowed.each do |book|
		borrowed_books << book.book
	end

	books_status = []
	books.each do |book|
		if borrowed_books.include?(book)
			books_status << {title: book["title"], status: 'Unavailable'}
		else
			books_status << {title: book["title"], status: 'Available'}
		end
	end

	books_status.to_json
end

get('/books/:id') do
	Book.find(params[:id]).to_json
end

get('/children') do
	Child.all.to_json
end

get('/children/:id') do
	Child.find(params[:id]).borrowedBook.to_json
end

get('/borrowedbooks') do
	borrowed = BorrowedBook.all
	borrowed_books = []
	borrowed.each do |book|
		borrowed_books << {book: book.book, child: book.child}
	end
	borrowed_books.to_json
end

get('/borrowedbooks/:id') do
	book = BorrowedBook.find(params[:id]).book
	child = BorrowedBook.find(params[:id]).child
	borrowed = ({book: book, child: child}).to_json
end

post('/books') do
	Book.create(book_params(params)).to_json
end

post('/children') do
	Child.create(child_params(params)).to_json
end

post('/borrowedbooks') do
	BorrowedBook.create(borrowed_params(params)).to_json
end

put('/books/:id') do
	Book.find(params[:id]).update(book_params(params)).to_json
end

put('/children/:id') do
	Child.find(params[:id]).update(child_params(params)).to_json
end

put('/borrowedbooks/:id') do
	BorrowedBook.find(params[:id]).update(book_params(params)).to_json
end

delete('/books/:id') do
	Book.find(params[:id]).destroy
end

delete('/children/:id') do
	Child.find(params[:id]).destroy
end

delete('/borrowedbooks/:id') do
	BorrowedBook.find(params[:id]).destroy
end

def book_params(params)
  params.slice(*Book.column_names)
end

def child_params(params)
  params.slice(*Child.column_names)
end

def borrowed_params(params)
  params.slice(*BorrowedBook.column_names)
end