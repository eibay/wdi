require 'pry'
require 'sinatra'


list = []
file = File.read("./public/list.txt")
file.split(", ").each {|x| list << x} if file.include?(",")

get "/" do
	erb(:index)
end

post "/subscribe" do
	list << request.params["email"]
	File.write("./public/list.txt", list.join(", "))
	erb(:display, { locals: { list: list } })
	binding.pry
end

