require "sinatra"
require "sinatra/reloader"
require_relative "connection"
require_relative "classes"
require "json"
require "pry"


# CRUD BOOKS
# get all books in library
get ("/books") do 
	books = Book.all.to_json
	books
end

# delete book in library
delete ("/books/:id") do 
	id = params["id"]
	book = Book.find(id)
	book.destroy()
	"Book #{book.name} was deleted from collection".to_json
end 

# add book to collection
post ("/book") do 
	name = params["name"]	
	Book.create(name: name)
	"#{name} was added to your book collection".to_json
end 

# edit book title and/or id
put ("/book/:id") do 
	id = params["id"]
	name = params["name"]
	book = Book.find(id)
	book.update({id: id, name: name})
	"Book #{id} was updated to #{name}".to_json
end 


# CRUD USERS

# get all library users
get ("/users") do 
	users = Child.all.to_json
	users
end

# delete user 
delete ("/users/:id") do 
	id = params["id"]
	user = Child.find(id)
	user.destroy()
	"User #{user.name} was deleted".to_json
end 

# add user =
post ("/users") do 
	name = params["name"]	
	Child.create(name: name)
	"#{name} was added to your library users".to_json
end 

# edit user's name and/or id
put ("/users/:id") do 
	id = params["id"]
	name = params["name"]
	user = Child.find(id)
	user.update({id: id, name: name})
	"Child #{id} was updated to #{name}".to_json
end 

# find all the books one user has checked out currently
get ("/users/:id/book") do 
	id = params["id"]
	user = BorrowedBook.find(child_id: id)
	file = []
	
	user.each do |a|
		book_title = Book.find_by(id: a.book_id)
		file.push({book_title: book_title, book_id: a.book_id})
	end 
	
	file.to_json
end 

# find the user has a specific book checked
get ("/books/:id/user") do 
	id = params["id"]
	book = BorrowedBook.find(book_id: id)
	
	user = Child.find_by(id: book.child_id)
		
	file = ({child: user, child_id: book.child_id})
	file.to_json
end 

# user returning a book to the library

delete ("/borowedbook/:id") do 
	id = params["id"]
	book = BorrowedBook.find(id)
	book.destroy()
	"Your book has been returned".to_json
end 


# user checking out a book 

post ("/borrowedbook") do 
	child_id = params["child_id"]
	book_id = params["book_id"]

	BorrowedBook.create({book_id: book_id, child_id: child_id})

	"User #{child_id} has checked out #{book_id}".to_json
end 
