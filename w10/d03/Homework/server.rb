require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require_relative './db/connection.rb'
require_relative './lib/book.rb'
require_relative './lib/user.rb'
require 'pry'
require 'uri'

get '/books' do
  books = Book.all();
  books.to_json
end

get '/users' do
  users = User.all();
  users.to_json
end

get '/users/:id' do
  user = User.find(params[:id])
  user.to_json
end

get '/books/:id' do
  book = Book.find(params[:id])
  book.to_json
end

## I realized right around here that I would need another entity to account for books borrowed so I could show a view in a restful way, all the specific books borrowed...
