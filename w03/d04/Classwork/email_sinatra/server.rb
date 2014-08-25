require 'sinatra'
require 'pry'

list = []

get("/") do
	erb(:index)
end

post("/info") do
	first = params["first_name"]
	last = params["last_name"]
	address = params["email_address"]

	list << "<ul><li>Firstname: #{first}</li>\n<li>Lastname: #{last}</li>\n<li>Email: #{address}</li></ul>\n\n"
	erb(:info, { locals: { info: list.join(' ') }})
end