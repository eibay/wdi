require 'sinatra'
require 'sinatra/reloader'

users = Hash.new

get '/' do 
	"welcome to our page"
end

get '/cookie' do 
	response.headers["Set-Cookie"] = "color=orange; path=/;"

	"ASDFGHJKL"
end

get '/see_cookie' do 
	request.cookies.to_s
end

get '/practice' do 
	if request.cookies["color"] == "orange"
		return "YAY I LOVE ORANGE"
	else 
		return "I HATE ORANGE"
	end
end


