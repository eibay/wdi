require 'sinatra'
require 'pry'


get("/") do
  erb(:index)
end

post("/emails") do
	# email = request.params["email_address"]
	# binding.pry
	erb(:emails, { locals: { email: params["email_address"] } })
end

post("/info") do
	erb(:info, { locals: { information: params["demo_form"] } })
	binding.pry
end

post("/info") do
	erb(:info, { locals: { information: params["input"] } })
end


    	

    	