require 'httparty'

class User
  def initialize(attrs)
      #different names! I can call them whatever I want
      #nothing is special about the name "attributes"
      @attributes = attrs
  end

  def greeting
    full_name = @attributes["first"] + " " + @attributes["last"]
    puts "Hi I am #{full_name} from #{@attributes['city']}"
  end

  def self.random_user
    #THINK: what type of object does this method return?
    return HTTParty.get("http://api.randomuser.me")
  end

  def self.bonus_random_user
    result = HTTParty.get("http://api.randomuser.me")
    user_info = result["results"][0]["user"]

    #this is how you build up a hash one key-value pair at a time
    attrs = {}
    attrs["city"] = user_info["location"]["city"]
    attrs["state"] = user_info["location"]["city"]
    attrs["first"] = user_info["name"]["first"]
    attrs["last"] = user_info["name"]["last"]
    attrs["gender"] = "unspecified"

    #notice that I can directly return the result of User.new
    return User.new(attrs)

    #I could have instead done this:
    #user = User.new(attrs)
    #return user
  end
end
