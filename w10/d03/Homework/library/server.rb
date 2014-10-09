require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'
require 'httparty'
require 'active_record'
require_relative 'connection'
require_relative 'models'

after do
	ActiveRecord::Base.connection.close
end

before do 
	content_type :json
end
# ~~~children

get ('/children') do
	Child.all.to_json
end

get ('/children/:id') do
	Child.find(params[:id]).to_json
end

post ('/children') do
	child = Child.create(child_params(params))

	child.to_json
end

put ('/children/:id') do
	child = Child.find_by(id: params[:id])
	child.update(child_params(params))

	child.to_json

end

delete ('/children/:id') do
	child = Child.find(params[:id])
	child.destory

	child.to_json
end

#  ~~~~books

get ('/books') do
	Book.all.to_json
end

get ('/books/:id') do
	Book.find_by(params[:id]).to_json
end

get ('/books/:id/status') do
	book = Book.find(params[:id])
	if Loan.all.find_by({book_id: params[:id]})
		"#{book["title"]} is Out."
	else
		"#{book["title"]} is Available."
	end

end

post ('/books') do
	book = Book.create(book_params(params))
	book.to_json
end

put ('/books/:id') do
	book = Book.find(params[:id])
	book.update(book_params(params))

	book.to_json
end

delete ('/books/:id') do
	book = Book.find(params[:id])
	book.destroy

	book.to_json
end

# ~~~~loans

get ('/loans') do
	Loan.all.to_json
end

get ('/loans/:id') do
	Loan.find_by(params[:id]).to_json
end

post ('/loans') do
	loan = Loan.create(loan_params(params))
	# loan = Loan.create({
	# 	child_id: params[:child_id],
	# 	book_id: params[:book_id]
	# 	})
	loan.to_json
end

put ('/loans/:id') do
	loan = Loan.find(params[:id])
	loan.update(loan_params(params))

	loan.to_json
end

delete ('/loans/:id') do
	loan = Loan.find(params[:id])
	loan.destroy

	loan.to_json
end



def child_params(params)
	params.slice(*Child.column_names)
end

def book_params(params)
	params.slice(*Book.column_names)
end

def loan_params(params)
	params.slice(*Loan.column_names)
end

