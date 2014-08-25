require 'sinatra'
require 'pry'

get('/') do
	erb(:index)
end

information = []

post('/information') do
	information.push params["firstnames"]
	information.push params["lastnames"]
	information.push params["email"]
	erb(:email, {locals: {email: information, lastnames: information, firstnames: information}})
end 

