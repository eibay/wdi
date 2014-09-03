require 'sinatra'

get '/' do
	erb(:index)
end

emailadd= []

post '/emails' do
	email = request.params["email"]
	emailadd << "<li>#{address}</li>"
	erb(:emails,{locals: { email:email.join(' ') } })
end

# get("/emails") do
# 	tag = request.params["email"]
# 	erb(:emails, {locals: { email:email } })
# end