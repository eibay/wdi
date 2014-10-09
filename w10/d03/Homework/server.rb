require 'sinatra'
require_relative 'connection'
require_relative 'models'
require 'active_support'
require 'sinatra/reloader'
require 'pry'
require 'json'

after do
  ActiveRecord::Base.connection.close
end

before do
  content_type :json
end
binding.pry
get('/books') do
	books = Book.all()
	books.to_json
end

get('/books/:id') do
	book = Book.find(params[:id])
	book.to_json
end

get '/books/:id/status' do
  this_book = Book.find(params[:id])
  if this_book.availability == true
    "#{this_book["name"]}: Available"
  else
    "#{this_book["name"]}: Borrowed"
  end
end

post('/books') do
   id = Book.all.last.id
   Book.create({name: "book_#{id+1}", availability: true})
end

put('/books/:id') do
   id = Book.all.last.id

   to_edit = Book.find(params[:id])
   to_edit.name = "edited_#{id+1}"
   to_edit.save
end

delete('/books/:id') do
    to_destroy = Book.find(params[:id])
    to_destroy.destroy
	redirect '/books'
end


get('/children') do
	children = Child.all()
	children.to_json
end

get('/children/:id') do
	book = Child.find(params[:id])
	book.to_json
end

post('/children') do
  id = Child.all.last.id
  books = Book.all()
  list = []

  books.each do |book|
  	if book.availability == true
  		list << book.id
  	end
  end

  book_id = list[rand(list.length)]
  book = Book.find(book_id)
  book.update({availability: false})
  book.save
  
  Child.create({name: "Rascal_#{id+1}", book_id: book_id})
end

put('/children/:id') do
  id = Child.all.last.id

  to_rename = Child.find(params[:id])
  to_rename.update({name: "renamed_#{id+1}"})
  to_rename.save
end

delete('/children/:id') do
	child = Child.find(params[:id])
	child.destroy
	redirect '/children'
end

get '/borrowedbooks' do
  books = Book.all()
  borrowed_list = []
  books.each do |book|
	if book.availability == true
	  	borrowed_list << book
  	end
  end
  borrowed_list.to_json

end
