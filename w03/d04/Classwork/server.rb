require 'sinatra'
require 'pry'

information = []
# email_addresses = []
# first_names = []
# last_names = []
# postal_addresses = []

get("/") do
	erb(:index)
end

post("/info") do
	email_address = request.params["email_address"]
	first_name = request.params["first_name"]
	last_name = request.params["last_name"]
	address = request.params["address"]

	information << "<li>#{email_address}<br>#{first_name} #{last_name}<br>#{address}</li>"
	# email_addresses << "<li>#{email_address}</li>"
	# first_names << "<li>#{first_name}</li>"
	# last_names << "<li>#{last_name}</li>"
	# postal_addresses << "<li>#{address}</li>"

	erb(:info, { locals: { information: information } })

end

#<li><%= info[:first_name] + info[:last_name] + info[:email_address] + info[:address] %>