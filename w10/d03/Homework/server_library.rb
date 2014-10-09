require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'active_record'

# require_relative './connection_and_models'

require 'active_record'
ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "AdrianMLin",
  :database => "library"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)




class Book < ActiveRecord::Base
end

class Child < ActiveRecord::Base
  self.has_many(:borrowedbooks)
end

class Borrowedbook < ActiveRecord::Base
  self.has_one(:book)
end



after do
  ActiveRecord::Base.connection.close
end


get '/books' do
  Book.all.to_json
end

get '/books/:id' do
  Book.all.find(params[:id]).to_json
end

get '/books/:id/status' do
  this_book = Book.find(params[:id])
  if Borrowedbook.all.find_by({book_id: params[:id]})
    "#{this_book["name"]}: Borrowed"
  else
    "#{this_book["name"]}: Available"
  end
end

post '/books' do
  id = Book.all.last.id
  Book.create({name: "book_#{id+1}"})
end

put '/books/:id' do
  id = Book.all.last.id

  to_edit = Book.find(params[:id])
  to_edit.name = "edited_#{id+1}"
  to_edit.save
end

delete '/books/:id' do
  to_destroy = Book.find(params[:id])
  to_destroy.destroy
end




get '/children' do
  Child.all.to_json
end

get '/children/:id' do
  Child.all.find(params[:id]).to_json
end

post '/children' do
  id = Child.all.last.id
  Child.create({name: "Rascal_#{id+1}"})
end

put '/children/:id' do
  id = Child.all.last.id

  to_rename = Child.find(params[:id])
  to_rename.update({name: "renamed_#{id+1}"})
  to_rename.save
end

delete '/children/:id' do
  to_release = Child.find(params[:id])
  to_release.destroy
end





get '/borrowedbooks' do
  borrowed = Borrowedbook.all
  borrowed_parsed = JSON.parse(borrowed.to_json)

  borrowed_id_array = []
  borrowed_parsed.each do |borrowed|
    borrowed_id_array << borrowed["book_id"]
  end


  borrowed_books_array = []
  borrowed_id_array.each do |id|
    書 = Book.find(id)
    borrowed_books_array << 書
  end

  borrowed_books_array.to_json

end

post '/borrowedbooks' do 
  Borrowedbook.create({book_id: params["book_id"], child_id: params["child_id"]})
end

delete '/borrowedbooks/:id' do
  returned_book = BorrowedBook.find(params["id"])
  returned_book.destroy
end

get '/borrowers' do
  borrowed = Borrowedbook.all
  borrowed_parsed = JSON.parse(borrowed.to_json)

  borrower_id_array = []
  borrowed_parsed.each do |borrowed|
    borrower_id_array << borrowed["child_id"] unless borrower_id_array.include?(borrowed["child_id"])
  end
  

  borrower_array = []
  borrower_id_array.each do |id|
    孩 = Child.find(id)
    borrower_array << 孩
  end

  borrower_array.to_json

end

















