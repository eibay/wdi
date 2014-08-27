# Assignment: 

# take in form info from user to create a user record

# display that user's record along with the records of previous users

# bonus - be able to access those saved emails AFTER restarting the server


require 'sinatra'
require 'pry'

get("/") do
  erb(:records_index_page)
end


student_data_array = []
all_records = []

post("/records_list") do

email = params["email"]
first_name = params["first_name"]
last_name = params["last_name"]

# binding.pry

student_data_array = [first: first_name, last: last_name, user_email: email]


student_data_array.join(",")
# i know these two steps worked, i tried on a simple version of this in pry

# binding.pry

all_records.push(student_data_array)
all_records.join(",")

erb(:records_list, { locals: { email: email, first_name: first_name, student_data_array: student_data_array, all_records: all_records } })
end
