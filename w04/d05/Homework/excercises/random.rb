require 'pry'
require 'httparty'
require 'erb'


result = HTTParty.get("http://api.randomuser.me")
user_info = result["results"][0]["user"]

user1 = {
full_name: user_info["name"]["title"].capitalize + ". " + user_info["name"]["first"].capitalize + " " + user_info["name"]["last"].capitalize,
city: user_info["location"]["city"].capitalize,
state: user_info["location"]["state"].capitalize
}


puts user1

# erb("This awesome person is named #{user1[:full_name]}. They live in #{user1[:city]}, #{user1[:state]}.")

#ERROR UNDEFINED METHOD ERB???

erb(:file, { locals: { full_name: user1[:full_name], city: user1[:city], state: user1[:state]} })





