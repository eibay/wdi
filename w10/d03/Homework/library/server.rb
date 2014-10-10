require_relative "./connection"
require "sinatra"
require "sinatra/reloader"
require "pry"
require "json"

ActiveRecord::Base.logger = Logger.new(STDOUT)

classes = {"borrowers" => Borrower, "Books" => Book}

after do
	ActiveRecord::Base.connection.close
end

get "/borrowers" do
	Borrower.all.to_json
end

get "/books" do
	Book.all.to_json
end

get "/borrower/:id" do
	content_type(:json)
	Borrower.find(params["id"]).to_json
end

get "/book/:id" do
	content_type(:json)
	Book.find(params["id"]).to_json
end

get "/borrower/:id/books" do
	Book.where(borrower_id: params["id"]).to_json
end

post "/borrower" do
	content_type(:json)
	hash = JSON.parse(request.body.read)
	borrower = Borrower.create(hash)
	borrower.to_json
end

post "/book" do
	content_type(:json)
	hash = JSON.parse(request.body.read)
	book = Book.create(hash)
	book.to_json
end

put "/borrower/:id" do
	content_type(:json)
	hash = JSON.parse(request.body.read)
	borrower = Borrower.find(params["id"])
	borrower.update(hash)
	borrower.to_json
end

put "/book/:id" do
	content_type(:json)
	hash = JSON.parse(request.body.read)
	book = Book.find(params["id"])
	book.update(hash)
	book.to_json
end

delete "/borrower/:id" do
	borrower = Borrower.find(params["id"])
	borrower.destroy
	[200]
end

delete "/book/:id" do
	book = Book.find(params["id"])
	book.destroy
	[200]
end









