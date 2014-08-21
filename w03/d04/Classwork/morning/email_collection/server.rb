require 'pry'
require 'sinatra'

#main index page
get ('/') do
	erb(:index)
end

emails = []

#display email
post("/email") do
  email = request.params["email_address"]
  emails.push(email)
  erb(:email, { locals: { all_email: emails } })
end



