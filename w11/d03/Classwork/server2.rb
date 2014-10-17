require "pry"
require "sinatra"
require "sinatra/reloader"

use Rack::Session::Cookie, {
	:key => 'rack.session',
	:path => "/",
	:secret => "monkeybrains"
}

users = {"bubba" => "gump"}

get "/" do
	if (session[:username]) && (users[ session[:username] ])
		"Welcome back, #{session[:username]}!"
	else
		"Welcome to Our Page!"
	end
end

get "/colors" do
	session[:color] = "orange"
	"Color was set"
end

get "/signup/:username/:password" do
	unless session[:username]
		users[ params["username"] ] = params["password"]
		puts users
		"User '#{params['username']}' has been created!"
	else
		"You are already logged in as #{session[:username]}"
	end
end


get "/login/:username/:password" do
	unless session[:username]
		if users[ params["username"] ] == params["password"]
			# response.headers["Set-Cookie"] = "username=#{params["username"]}; path=/;"
			session[:username] = params["username"]
			"#{params["username"]} is logged in!"
		else
			"That user or password is not recognized"
		end
	else
		"You are already logged in as #{session[:username]}"
	end
end

get "/logout" do
	response.delete_cookie("rack.session")
	"You have logged out"
end

# get "/colors" do
# 	response.headers["Set-Cookie"] = "color=orange; path=/;"
# 	"Thank you!"
# end

# get "/orange" do
# 	if request.cookies["color"] == "orange"
# 		"OK You're fine!"
# 	else
# 		"That color sucks"
# 	end
# end

get "/pry" do
	binding.pry
end