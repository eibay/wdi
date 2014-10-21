require 'sinatra'
require 'sinatra/reloader'
require 'pry'

users = Hash.new

get '/' do 
	"Welcome to our page!"

end

# get '/colors' do
# 	response.headers["Set-Cookie"] = "color=red; path=/;"

# 	"cookies sent"
# end

# get '/see_cookie' do 
# 	if request.cookies["color"] == "orange"
# 		puts "orange"
# 	else puts "nope"
# 	end
#end

get '/signup/:user/:password' do
	users[params[:user]] = params[:password]
	"you've signed up!"
end

get '/login/:user/:password' do 
	if users[ params[:user]] == params[:password]
		response.headers["Set-Cookie"] = "user = #{params[:user]}; path=/;"
		"you've logged in!"
	else
		"try again"
	end
end

get '/logout' do 
	response.delete_cookie("user")
	"you've logged out!"
end

get '/greeting' do

	if request.cookies["user"]
		"hello, #{request.cookies["user"]}"
	else
		"please login"
	end
end


