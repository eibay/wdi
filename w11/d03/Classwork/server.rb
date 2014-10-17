require 'sinatra'
require 'sinatra/reloader'
require 'faker'
require 'pry'

users = Hash.new

class Person
	def initialize(name, password)
		@name = name
		@password = password
	end
end

get '/' do 
	"welcome to our page!"
end

get '/colors' do
	response.headers["Set-Cookie"] = "color=orange; path=/;"

	"cookies sent"
end

get '/see_cookie' do
	request.cookies.to_s
end

get '/orange' do
	if request.cookies["color"] == "orange"
		"It's orange"
	else
		"This color sucks"
	end
end

get '/signup' do

	name = "Amy Williamson"
	password = "5255RRR"

	user = Person.new(name, password)

end



