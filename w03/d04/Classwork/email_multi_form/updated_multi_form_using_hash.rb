# Assignment: 

# take in form info from user to create a user record

# display that user's record along with the records of previous users

# bonus - be able to access those saved emails AFTER restarting the server


require 'sinatra'
require 'pry'

get("/") do
  erb(:records_index_page)
end



student_data_hash = {}

post("/records_list") do

email = params["email"]
first_name = params["first_name"]
last_name = params["last_name"]


# QUESTION - do we CREATE the keys for the values we know? this isn't like the locals hash in the erb function below - or is it?

# ANSWER = SINATRA RECOGNIZES THE KEYS FROM THE FORM 'NAME' VALUES WE TYPED IN

student_data_array = [first_name, last_name, email]
student_data_array.join(",")
# i know these two steps worked, i tried on a simple version of this in pry



# doing student data as a hash now

# this is what Neel put on the board

# # SERVER:
# the complete record array of every individual 'student_data_array'


# information = [{first: "Neel", last: "Patel", email: "patel@patel.com"},
# {first: "Sean", last: "West", email: "west@west.com"},
# {first: "Jeff", last: "Kon", email: "kon@kon.com"}]



# # ERB (HTML) FILE:

# <html>
# <% information.each do |info|%>
# <li><%=info[:first] + info[:last] + info[:email]%></li>
# <% end %>
# </html>

# if we did it in the server, wed have to make that second line of the .each = to a variable so we can recall a value:

# 	record = info[:first] + info[:last] + info[:email]  

# then we wld have to format it as a string, maybe like this: 
	
# record = "#{info[:first]} + #{info[:last]} + #{info[:email]}"  



erb(:records_list, { locals: { email: email, first_name: first_name, student_data_array: student_data_array } })
end
















