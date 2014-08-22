require 'sinatra' 
require 'pry'


get("/")do 
	erb(:index) 
end

# email_list =[]

hash_information = {}

post ("/email")do

array_fullname= []
	email = params["email"]
	first_name = params["first_name"]
	last_name =  params["last_name"]

array_fullname<<first_name
array_fullname<<last_name

hash_information[email] = array_fullname


# email_list.push(email)
# erb(:email_list, {locals: {email_list: email_list} })
end


 