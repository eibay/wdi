require_relative "./greeter"
require "sinatra"

get "/" do
	erb(:index)
end

get "/search" do
	list = Greeter.select_by("name", params["name"])
	erb(:results, { locals: {list: list } })
end