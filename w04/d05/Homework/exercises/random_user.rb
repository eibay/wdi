require 'HTTParty'
require 'pry'


def random_user()
  random_user = HTTParty.get('http://api.randomuser.me/')

  user = random_user["results"][0]["user"]
  output = {
    full_name: user["name"]["first"] + " " + user["name"]["last"],
    city: user["location"]["city"],
    state: user["location"]["state"]
    }

  return output
end


puts random_user()
