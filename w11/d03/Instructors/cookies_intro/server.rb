require 'sinatra'
require 'sinatra/reloader'

get '/' do
	"Welcome to our page!"
end

get '/colors' do
	response.headers["Set-Cookie"] = "color=blue; path=/;"

	"Cookies sent!"
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