require 'sinatra'
require 'yaml'

if File.exists? "./guest_book.yml"
	f = File.read "./guest_book.yml"
	book = YAML.load f 
else 
	book = []
end 

get '/' do 
	erb :index
end 

post "/guest_list" do 
	*i = request.params["name"], request.params["email"], request.params["said"] 
	book << i
	File.open "./guest_book.yml", 'w' do |f|
		f << book.to_yaml 
	end 
	erb(:guests, { locals: {book: book}})
end 

get "/guest_list" do 
	erb(:guests, { locals: {book: book}})
end 