require_relative "./connection.rb"
require_relative "./models.rb"
require "sinatra"
require "sinatra/reloader"
require "pry"
require "json"
require "active_support"

after do
	ActiveRecord::Base.connection.close
end

before do
	content_type :json
end

get("/books") do
	books = Book.all
	books.to_json
end

get("/members") do
	members = Member.all
	members.to_json
end

get("/books/:id") do
	book = Book.find(params[:id])
	book.to_json
end

get("/members/:id") do
	member = Member.find(params[:id])
	member.to_json
end

post("/books") do	
	my_params = JSON.parse(request.body.read)

	book = Book.create({
  title: my_params[:title], 
  borrowed_on: "5874896 AD",
  member_id: 0,
	})

	book.to_json
end

post("/members") do	
	my_params = JSON.parse(request.body.read)

	member = Member.create({
  name: my_params[:name], 
	})

	book.to_json
end

put("/books") do	
	my_params = JSON.parse(request.body.read)

	book = Book.update({
  title: my_params[:title], 
  borrowed_on: my_params[:date],
  member_id: my_params[:member_id],
	})

	book.to_json
end

put("/members") do	
	my_params = JSON.parse(request.body.read)

	member = Member.update({
  name: my_params[:name], 
	})

	member.to_json
end

delete("/books/:id") do
	book = Book.find(params[:id])
	book.destroy
	book.to_json
end

delete("/members/:id") do
	member = Member.find(params[:id])
	member.destroy
	member.to_json
end

get("/member/:id/books") do
	member = Member.find(params[:id])
	books = member.books
	books.to_json
end

get("/borrowed") do
	books = Book.all
	borrowed_books = []
	books.each do |book|
		if book.member_id > 0
			borrowed_books << book
		end
	end
	borrowed_books.to_json
end

