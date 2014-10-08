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

get('/books') do

	Book.all.to_json

end

get('/books/:id') do

	book = Book.find_by(id: params[:id])
	book.to_json

end

get('/books/:id/borrowed') do

	book = Book.find_by(id: params[:id])
	book.borrowedbooks.to_json

end

get('/children') do 

	Child.all.to_json

end

get('/children/:id') do 

	child = Child.find_by(id: params[:id])
	child.to_json

end

get('/children/:id/borrowed') do 

	child = Child.find_by(id: params[:id])
	child.borrowedbooks.to_json

end

get('/borrowedbooks') do 

	Borrowedbook.all.to_json

end

get('/borrowedbooks/:id') do 

	borrowed = Borrowedbook.find_by(id: params[:id])
	borrowed.to_json

end