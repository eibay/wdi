require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require 'JSON'
require_relative './connection.rb'
require_relative './models.rb'

after do
	ActiveRecord::Base.connection.close
end

# get all books info
get ("/books") do
	Book.all.to_json
end

#see if a book is in or out
get ("/books/:id") do
	thisBook = Book.where(id: params[:id])
	if thisBook[0].kids_id > 0
		return { error: "This book is out." }.to_json
	end
else return thisBook.to_json
end

# get a list of members
get ("/kids") do
	Kid.all.to_json
end

# get an inidividual member's info
get ("/kids/:id") do
	Kid.where(id: params[:id]).to_json
end

# get books borrowed by a member
get ("kids/:id/books") do 
	Book.where(kids_id: params[:id]).to_json
end

# create new member
post ("/kids") do
	newKid = {
		name: params[:name]
	}
	Kid.create(newKid)
end

# change member name
put ("/kids/:id") do
	editKid = Kid.where(id: params[:id])
	editKid.update(name: params[:name])
	editKid.save
end

# delete member
delete ("/kids/:id") do 
	deleteKid = Kid.where(id: params[:id])
	deleteKid.delete
end





