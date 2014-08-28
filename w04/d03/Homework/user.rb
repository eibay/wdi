require 'HTTParty'
require 'pry'
class User

def initialize(information)
  @name = information["first_name"]
  @last = information["last_name"]
  @gender = information["gender"]
  @city = information["city"]
  @state = information["state"]
end
#destructuring a hash cant call initialize only for new instances
#of USer
def greeting
 return @name, @last, @city
end

def self.randomuser
  newuser = HTTParty.get("http://api.randomuser.me")
  return information = {"first_name"=>newuser["results"][0]["user"]["name"]["first"], 
    "last_name" => newuser["results"][0]["user"]["name"]["last"], 
    "gender" => newuser["results"][0]["user"]["gender"], 
    "city"=>newuser["results"][0]["user"]["location"]["city"],
     "state"=>newuser["results"][0]["user"]["location"]["state"]}
  end
end

user = User.new(User.randomuser)
puts user.greeting 
