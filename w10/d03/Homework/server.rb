require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require_relative './db/connection'
require_relative './models/book'
require_relative './models/child'
require_relative './models/borrow'


after do
  ActiveRecord::Base.connection.close
end

# TO GET ALL BOOKS
get '/books' do 

	books = Book.all
	return books.to_json

end

#TO ADD A NEW BOOK
post '/books' do

	book_params = params
	binding.pry
	Book.create(book_params)
	
	redirect '/books'

end

# TO UPDATE A PARTICULAR BOOK'S INFO
put '/books/:id' do 

	new_title = params['title']
	id = params['id']
	binding.pry
	book = Book.find(id)
	book.update(title: new_title)

	return book.to_json

end

# TO GET A PARTICULAR BOOK
get '/books/:id' do

	id = params['id']
	book = Book.where({id: id})
	return book.to_json

end

# TO DELETE A BOOK
delete '/books/:id' do

	id = params['id']
	book = Book.find(id)
	book.destroy()

	redirect '/books'

end

# TO GET ALL CHILDREN
get '/children' do

	children = Child.all
	return children.to_json

end

# TO GET A LIST OF BOOKS A PARTICULAR CHILD HAS
get '/children/:id/books' do

	id = params['id']
	books = Books.where({book_id: book_id})
	return books.to_json

end


# TO GET A LIST OF CHILDREN WHO BORROWED A PARTICULAR BOOK
get '/books/:id/children' do

	book_id = params['id']
	borrows = Borrow.where({book_id: book_id})
	
	children = []

	borrows.each do |borrow|
		child = Child.where({ id: borrow.child_id })
		children.push(child)
	end

	return children.to_json

end





