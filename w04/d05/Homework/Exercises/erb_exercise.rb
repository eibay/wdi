require 'pry'
require 'httparty'
require 'erb'

response = HTTParty.get("http://api.randomuser.me/")

hash = {}

first = response["results"][0]["user"]["name"]["first"].capitalize

last = response["results"][0]["user"]["name"]["last"].capitalize

hash[:fullname] = first + " " + last

hash[:city] = response["results"][0]["user"]["location"]["city"].capitalize

hash[:state] = response["results"][0]["user"]["location"]["state"].capitalize

#erb(:randomperson, { locals: { fullname: hash[:fullname], city: hash[:city], state: hash[:state] } })

fullname = hash[:fullname]
city = hash[:city]
state = hash[:state]


# I totally copied this solution from Brenda
erb_template =	"This awesome person is named <%= fullname %>. They live in <%= city %>, <%= state %>."

output = ERB.new(erb_template)
sentence = output.result()
puts sentence