require 'sinatra'

get("/") do
erb(:index)
end

emails =[]
#can also do string emails =" "
#list += "<li>" + email + ",</li>"
#dont need li in list.erb then

post("/list") do
   email = request.params["email"]
  #can do params
  address = request.params["address"]
  firstname = params["firstname"]
  lastname = params["lastname"]
  if address.include? ".com"
    emails << firstname + " " + lastname + " " + email +"@"+ address  
    #cant get values out so better to do hash in arrays
    erb(:list, {locals: {email: emails}})
    #this is just a hash! because it helps maintain order
  elsif firstname.length > 0 && lastname.length > 0
    emails << firstname + " " + lastname
    erb(:list, {locals: {email: emails, email_error: "No email address"}})
  else 
    erb(:list, {locals: {email: emails, email_error: "Forgot your name, try again"}})
  
  end
end

get("/list") do
	email = request.params["email"]
	erb(:list, {locals: {email: emails}})
end

#if array of hashes in the erb
#info.each do |info|
#<li> <%=info[first] + info[last] + info[email] %></li>
#end
