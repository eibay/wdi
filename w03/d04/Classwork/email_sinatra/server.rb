require "sinatra"

get('/') do 
	erb(:index)
end

saved_profiles = ""

post('/email') do
	email = params["email_to_add"]
	first_name = params["first_name"]
	last_name = params["last_name"]
	favorite_color = params["favorite_color"]
	saved_profiles += "<li style='color: #{favorite_color};'>#{first_name} #{last_name}, #{email}</li>"
	erb(:saved_email_page, {locals: {saved_profiles: saved_profiles}})
end

get('/email') do
	erb(:saved_email_page, {locals: {saved_emails: saved_emails}})
end
