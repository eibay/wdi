require "pry"
require "sinatra"
require "sinatra/reloader"
require "json"
require "httparty"

fake_people = []

get "/" do

	users = fake_people[0..4]
	fake_people.length > 5 ? more = true : more = false
	erb(:index, locals: { users: users, page: 1, more: more })

end

post "/user/new" do

	user_json = HTTParty.get("http://127.0.0.1:2000/user/create")
	user = JSON.parse(user_json)
	user["comments"] = []
	user["id"] = fake_people.length
	fake_people << user
	redirect("/user/#{user["id"]}")

end

get "/:page" do

	first = params["page"].to_i
	last = first + 4
	users = fake_people[first..last]
	fake_people.length > 5 * params["page"].to_i ? more = true : more = false
	erb(:index, { locals: { users: users, page: params["page"].to_i, more: more } })

end


get "/user/:id" do

	user = fake_people.find { |faker| faker["id"] == params["id"].to_i }
	erb(:user, locals: { user: user })

end

post "/user/:id/comment" do

	fake_people[params["id"].to_i]["comments"] << params["comment"]
	redirect("/user/#{params['id']}")

end
