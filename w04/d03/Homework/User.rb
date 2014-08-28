require "httparty"

class User

  def initialize(first_name, last_name, gender, city, state)
    @first_name = first_name
    @last_name = last_name
    @gender = gender
    @city = city
    @state = state
  end

  def greeting
    return "Hi, my name is #{@first_name} #{@last_name}, a #{@gender} from #{@city}, #{@st}"
  end

  def self.random_user_hash
    rand = HTTParty.get("http://api.randomuser.me/")
    
    first_name = rand["results"][0]["user"]["name"]["first"]
    last_name = rand["results"][0]["user"]["name"]["last"]
    gender = rand["results"][0]["user"]["gender"]
    city = rand["results"][0]["user"]["location"]["city"]
    state = rand["results"][0]["user"]["location"]["state"]

    return {first_name: first_name, last_name: last_name, gender: gender, city: city, state: state}
  end

  def self.random_user_creation
    rand = HTTParty.get("http://api.randomuser.me/")
    
    first_name = rand["results"][0]["user"]["name"]["first"]
    last_name = rand["results"][0]["user"]["name"]["last"]
    gender = rand["results"][0]["user"]["gender"]
    city = rand["results"][0]["user"]["location"]["city"]
    state = rand["results"][0]["user"]["location"]["state"]

    return self.new(first_name, last_name, gender, city, state)
  end

end

