
require 'sinatra'

get '/' do
	erb(:index_without_names)
end




email_database = []
post '/register' do

	email = params["email"]
	# p "request.params['email']: #{email}"
	if email.include?("@")
		email_database << email
	else
		error_message = "That, sir, is not an email!"
	end
	# p "email_database = #{email_database}"


	##########



	erb(:email_list_without_names, {locals: {email_db: email_database, error: error_message}})
end
