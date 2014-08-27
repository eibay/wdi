require 'pry'
require 'httparty'
require_relative './lib/shuttle'
require_relative './lib/astronaut'

# 5.times do
# 	name = ["Explorer", "Planetsmasher", "Curiosity Kills", "Gravity's Rainbow", "Bleeding Edge"].sample
# 	origin_country = ["USA", "China", "Russia", "Korea", "Germany"].sample
# 	destination = ["Mars", "Jupiter", "Uranus", "Pluto", "Saturn"].sample
# 	Shuttle.new(name, origin_country, destination)
# end


# 20.times do
# 	rand_person = HTTParty.get('http://api.randomuser.me/')
# 	name = rand_person["results"][0]["user"]["name"]["first"].capitalize
# 	rank = (1..5).to_a.sample
# 	shuttles = Shuttle.all()
# 	shuttle = shuttles.sample		
# 	shuttle_id = shuttle["id"]
# 	Astronaut.new(name, rank, shuttle_id)
# end

binding.pry
