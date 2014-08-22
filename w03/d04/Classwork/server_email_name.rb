require 'sinatra'

list = " "

get '/' do 
	erb(:index_email_name)
end

post '/allemailname' do
	
