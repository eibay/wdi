require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'
require 'json'
require 'active_record'
require_relative './lib/connection'
require_relative './lib/book'

get('/') do
	html = File.open('./index.html')
end

get('/books') do
	books = []
	all_books = Book.all()	
	all_books.each {|book| books << book.title}
	books.to_json
end

post('/books') do
	book = request.body.read
	Book.create({title: book})
end

delete('/book') do
	book = Book.find_by(title: params[:title])
	binding.pry
	book.destroy()
end

get('/books/:title') do
	title = URI.encode(params[:title])
	response['Access-Control-Allow-Origin'] = '*'
  content_type 'json'
	book = HTTParty.get("https://www.goodreads.com/book/title?format=xml&key=CZSVW6Mo6ccy1315CDfXpg&title=#{title}")
	book.to_json
end