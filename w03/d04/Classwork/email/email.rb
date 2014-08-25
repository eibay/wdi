require 'sinatra'
require 'pry'

info = ""

get('/') do
	erb(:index)
end

post('/emails') do

	email = params["email"]
	first = params["first"]
	last = params["last"]

	info += "<li>#{email}: #{first} #{last}</li>"

	erb(:emails, {locals: { info: info} })

end

get '/emails' do
	
	erb(:emails, {locals: { info: info} })

end