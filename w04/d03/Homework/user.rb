require 'HTTParty'
# for the api in the class method

class User

	def initialize(user)
#instance method with instance variable by putting "@" in front making it available to other method
		@first = user[:first_name]
		@last = user[:last_name]
		@gender = user[:gender]
		@city = user[:city]
		@state = user[:state]

	end

	def greeting
	#Introduce using instance method and outputing using instance variable
		puts "Hi! My name is #{@first_name}. I live in #{@city}."
	end

	def self.random_user
	#Class method - using api to generate random user
		response = HTTParty.get("http://api.randomuser.me")
		@first_name = response["results"][0]["user"]["name"]["first"].capitalize
		@last_name = response["results"][0]["user"]["name"]["last"].capitalize
		@gender = response["results"][0]["user"]["gender"]
		@city = response["results"][0]["user"]["location"]["city"].capitalize	
		@state = response["results"][0]["user"]["location"]["state"].capitalize	
		return { first_name: @first_name, last_name: @last_name, gender: @gender, city: @city, state: @state }

	end

end
#using pry, was able to parse the information from api

# [1] Pry(main)> require 'httparty'
# true
# [2] Pry(main)> response = HTTParty.get("http://api.randomuser.me/")
# {
#     "results" => [
#         [0] {
#                "user" => {
#                     "gender" => "female",
#                       "name" => {
#                     "title" => "ms",
#                     "first" => "glenda",
#                      "last" => "peterson"
#                 },
#                   "location" => {
#                     "street" => "4845 hinckley blvd",
#                       "city" => "price",
#                      "state" => "alabama",
#                        "zip" => "44910"
#                 },
#                      "email" => "glenda.peterson74@example.com",
#                   "username" => "crazypanda626",
#                   "password" => "nudist",
#                       "salt" => "g6feIQU4",
#                        "md5" => "37cae0ad376d879374a3ef403639282a",
#                       "sha1" => "08abdc6357ee4f14665aee6dc0b5900b5cc71aff",
#                     "sha256" => "f6224e5e3d0f8cd06d6ad220ebba5cd83f1ee2cdac6e98ebc708d21445f2b292",
#                 "registered" => "1206656828",
#                        "dob" => "76317694",
#                      "phone" => "(155)-504-5678",
#                       "cell" => "(920)-409-1559",
#                        "SSN" => "816-68-9986",
#                    "picture" => "http://api.randomuser.me/portraits/women/70.jpg"
#             },
#                "seed" => "2aa15357f8ec494",
#             "version" => "0.4"
#         }
#     ]
# }
# [3] Pry(main)> response["results"][0]["user"]
# {
#         "gender" => "female",
#           "name" => {
#         "title" => "ms",
#         "first" => "glenda",
#          "last" => "peterson"
#     },
#       "location" => {
#         "street" => "4845 hinckley blvd",
#           "city" => "price",
#          "state" => "alabama",
#            "zip" => "44910"
#     },
#          "email" => "glenda.peterson74@example.com",
#       "username" => "crazypanda626",
#       "password" => "nudist",
#           "salt" => "g6feIQU4",
#            "md5" => "37cae0ad376d879374a3ef403639282a",
#           "sha1" => "08abdc6357ee4f14665aee6dc0b5900b5cc71aff",
#         "sha256" => "f6224e5e3d0f8cd06d6ad220ebba5cd83f1ee2cdac6e98ebc708d21445f2b292",
#     "registered" => "1206656828",
#            "dob" => "76317694",
#          "phone" => "(155)-504-5678",
#           "cell" => "(920)-409-1559",
#            "SSN" => "816-68-9986",
#        "picture" => "http://api.randomuser.me/portraits/women/70.jpg"
