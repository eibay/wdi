require 'sinatra'

get("/") do
	erb(:index)
end

all_addresses = []

post("/address_page") do
	addressx = params["address"]
	firstx = params["first"]
	lastx = params["last"]

#params is a hash

	all_addresses << addressx
	# all_addresses = all_addresses.join('')

	erb(:address_page, { locals: { all_addresseskey: all_addresses  } })

end