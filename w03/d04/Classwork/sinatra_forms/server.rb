require 'pry'
require 'sinatra'


list = []
file = File.read("./public/list.txt")
file.split("\n").each { |person| list << person.split(", ") }

get "/" do
	new_subscriber = false
	erb(:index, { locals: { new_subscriber: new_subscriber, list: list } })
end

get "/subscribe" do
	erb(:display)
end

# post "/subscribe" do
# 	new_subscriber = true
# 	guy = [params["first"], params["last"], params["email"]]
# 	list << guy
# 	string = ""
# 	list.each do |person|
# 		string = string + person.join(", ") + "\n"
# 	end
# 	File.write("public/list.txt", string)
# 	erb(:index, { locals: { new_subscriber: new_subscriber, list: list } })
# end


post "/subscribe" do
	new_subscriber = true
	guy = [params["first"], params["last"], params["email"]]
	list << guy
	File.open("public/list.txt") do |x|
		binding.pry
	end
	erb(:index, { locals: { new_subscriber: new_subscriber, list: list } })
end


