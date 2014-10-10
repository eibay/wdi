# still need a DELETE route for each of the three
# still need a PUT route for books and children

require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'json'

require_relative './connection'
require_relative './models'

after do
  ActiveRecord::Base.connection.close
end

before do
  content_type :json
end

get('/') do
end

# see all books
get('/books') do

	Book.all.to_json

end

# see a particular book
get('/books/:id') do

	book = Book.find_by(id: params[:id])
	book.to_json

end

# see if a particular book is borrowed and by whom
# ***** works if book is borrowed, but i need to figure out how to send the message if it's not checked out
get('/books/:id/borrowed') do
	book = Book.find_by(id: params[:id])
	borrowed = Borrowedbook.all
	available_msg = "This book is available"
	if book.borrowedbooks.where(book_id: params[:id])
		book.borrowedbooks.to_json
	else available_msg.to_json
	end

end

# create a book
post('/books') do

	book = Book.create(title: params[:title])

	book.to_json

	# to test 
	# HTTParty.post("http://127.0.0.1:4567/books", {:body => {title: "Alice in Wonderland"}})

end

# see all children
get('/children') do 

	Child.all.to_json

end

# see a particular child
get('/children/:id') do 

	child = Child.find_by(id: params[:id])
	child.to_json

end

# see what books a particular child has borrowed
get('/children/:id/borrowed') do 

	child = Child.find_by(id: params[:id])
	child.borrowedbooks.to_json

end

# create a child
post('/children') do

	child = Child.create(name: params[:name])

	child.to_json

	# to test 
	# HTTParty.post("http://127.0.0.1:4567/children", {:body => {name: "Carla"}})

end

# see all borrowed books
get('/borrowedbooks') do 

	Borrowedbook.all.to_json

end

# see a particular borrowed book
get('/borrowedbooks/:id') do 

	borrowed = Borrowedbook.find_by(id: params[:id])
	borrowed.to_json

end

# *** create a borrowed book transaction
post('/borrowedbooks') do

	borrowed = Borrowedbook.create(child_id: params[:child_id], book_id: params[:book_id])

	borrowed.to_json

		# to test 
		# HTTParty.post("http://127.0.0.1:4567/borrowedbooks", {:body => {child_id: child_id, book_id: book_id}})

end


