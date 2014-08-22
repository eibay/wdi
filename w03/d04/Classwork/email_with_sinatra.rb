require 'sinatra'
require 'pry'

info_array = []

get("/")do
  erb(:main)
end

# post("/email")do
#   email = params["email_id"]
#   if email.include?("@") && email.include?(".com")
#   email_array.push(email)
# else
#     file_not_found = "Try again!"
#     end
#   erb(:email_page, {locals: { ids: email, emails_group: email_array, error: file_not_found} })

# end

post("/information")do
  email = params["email_id"]
  first_name = params["first_name"]
  last_name = params["last_name"]
  phone_number = params["phone_number"]
  info_array.push(email, first_name, last_name, phone_number)
  #binding.pry
  erb(:info_page, {locals: { ids: [email ,first_name, last_name, phone_number], info: info_array }})
end