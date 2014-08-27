require_relative './lib/shuttle'
require_relative './lib/astronaut'
require 'pry'

# create a shuttle
# Shuttle.create({name: "Challenger", origin_country: "US", destination: "Mars"})

# create an astronaut
# challenger = Shuttle.find_by("name", "Challenger")
# Astronaut.create({name: "Buzz", rank: "Senior", shuttle_id: challenger["id"]})

# find all astronauts in a specific shuttle
# Astronaut.select_by("shuttle_id", challenger["id"])

# find the shuttle information for an astronaut
# buzz = Astronaut.find_by("name", "Buzz")
# Shuttle.find_by("id", buzz["shuttle_id"])


binding.pry