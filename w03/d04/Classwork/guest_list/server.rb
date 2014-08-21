require 'sinatra'
require 'yaml'

# load the guest book or create it # 
if File.exists? "./guest_book.yml"
	f = File.read "./guest_book.yml"
	book = YAML.load f 
else 
	book = []
end 

# main app # 

get '/' do 
	erb :index 
end 

post "/emails" do 
	*i = params["name"], params["email"], params["said"] 
	book << i
	File.open "./guest_book.yml", 'w' do |f|
		f << book.to_yaml 
	end 
	redirect "/emails"
end 

get "/emails" do 
	erb :emails, { locals: {book: book}}
end 