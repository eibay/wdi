create a shuttle
Shuttle.create({name: "Challenger", origin_country: "US", destination: "Mars"})

create an astronaut
Viking = Shuttle.find_by("name", "Viking")
Astronaut.create({name: "Steven", rank: "Junior", shuttle_id: viking["id"]})

find all astronauts in a specific shuttle
Astronaut.select_by("shuttle_id", challenger["id"])

find the shuttle information for an astronaut
buzz = Astronaut.find_by("name", "Buzz")
Shuttle.find_by("id", buzz["shuttle_id"])


Shuttle.create({name: "Atlantis", origin_country: "US", destination: "Venus"})



# create a car
# Car.create({color: "Blue", mileage: 40000, capacity: 10})

# create a clown
# blue_car = Car.find_by("color", "Blue")
# Clown.create({name: "Bozo", shoe_size: "XXXXL", car_id: blue_car["id"]})

# find all clowns in a specific car
# Clown.select_by("car_id", yellow_car["id"])

# find the car information for a clown
# bertha = Clown.find_by("name", "Bertha")
# Car.find_by("id", bertha["car_id"])



# yellow_car = Car.find_by("color", "Yellow")
# Clown.create({name: "Bertha", shoe_size: "XXL", car_id: yellow_car["id"]})