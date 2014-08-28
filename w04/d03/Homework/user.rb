require 'HTTParty'
require 'pry'

class User
  def initialize(hash)
    @attributes = hash
    # @first_name = hash[:first]
    # @last_name = hash[:last]
    # @gender = hash[:gender]
    # @city = hash[:city]
    # @state = hash[:state]
  end

  def greeting()
    return "Hello! My name is: #{@attributes[:first] + " " + @attributes[:last]}! I'm from: #{@attributes[:city]}, #{@attributes[:state]}"
  end

  def [](key)
    return @attributes[key]
  end

  def self.random()
    random_user = HTTParty.get("http://api.randomuser.me")
    random_user_info = random_user["results"][0]["user"]

    random_hash = {first: random_user_info["name"]["first"], last: random_user_info["name"]["last"], gender: random_user_info["gender"], city: random_user_info["location"]["city"], state: random_user_info["location"]["state"]}

    # puts random_user_info
    return (User.new(random_hash)
    # return random_user["results"][0]["user"]
  end
end
