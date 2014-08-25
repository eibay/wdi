require 'sinatra' 


get "/" do
file=File.read("public/emails.txt")
erb(:index, {locals:{file: file}})
end
emails=[]
get "/emails" do
	erb(:emails)
end
post "/emails" do

	email=params[:email]
	first_name=params[:first_name]
	last_name=params[:last_name]
	
add_email=File.open('public/emails.txt', 'a') 
  add_email.puts "<li>#{first_name} #{last_name}-<a href='mailto:#{email}'>#{email}</a></li>"
add_email.close
redirect '/'
end

