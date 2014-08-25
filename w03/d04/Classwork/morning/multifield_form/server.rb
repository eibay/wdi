require 'sinatra' 


first_names = []
last_names = []
email_lists = []

get ('/') do
	erb(:index)
end

post("/information") do
  first_names.push (params["first_name"])
  last_names.push (params["last_name"])
  email_lists.push (params["email"])
  erb(:list, { locals: { first_names: first_names, last_names: last_names, email_lists: email_lists } })
end