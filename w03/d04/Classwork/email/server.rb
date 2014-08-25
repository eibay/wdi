require 'sinatra'

get '/' do
	erb(:index)
end




hash_email_fullname = {}


post '/register' do
	ary_fullname = []
	first_name = params["first_name"]
	last_name = params["last_name"]


	email = params["email"]

	ary_fullname << first_name
	ary_fullname << last_name

	hash_email_fullname[email] = ary_fullname
	



	erb(:email_list, {locals: {hash: hash_email_fullname, email: email}})
end




# email_database = []
# post '/register' do

# 	email = params["email"]
# 	# p "request.params['email']: #{email}"
# 	if email.include?("@")
# 		email_database << email
# 	else
# 		error_message = "That, sir, is not an email!"
# 	end
# 	# p "email_database = #{email_database}"

# 	first_name = params["first_name"]


# 	last_name = params["last_name"]



# 	##########



# 	erb(:email_list, {locals: {email_db: email_database, error: error_message}})
# end
		# <% email_db.each do |x| %>
		# 	<li><%= x %> </li>
		# <% end %>

# <!-- 		<% if error %> control if error message occurs
# 			<h3> <%= error %> </h3>
# 		<% end %>
#  -->


