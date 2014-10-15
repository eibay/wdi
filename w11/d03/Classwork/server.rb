require "pry"
require "sinatra"
require "sinatra/reloader"

users = Hash.new

get "/" do
	if (request.cookies["username"]) && (users[ request.cookies["username"] ])
		"Welcome back, #{request.cookies['username']}!"
	else
		"Welcome to Our Page!"
	end
end

get "/signup/:username/:password" do
	users[ params["username"] ] = params["password"]
	puts users
	"User '#{params['username']}' has been created!"
end


get "/login/:username/:password" do
	if users[ params["username"] ] == params["password"]
		response.headers["Set-Cookie"] = "username=#{params["username"]}; path=/;"
		"#{params["username"]} is logged in!"
	else
		"That user or password is not recognized"
	end
end

get "/logout" do
	response.headers["Set-Cookie"] = "username=#{SecureRandom.base64}; path=/; expires=#{Time.now.asctime};"
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
