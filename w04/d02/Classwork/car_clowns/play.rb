require_relative './car'
require_relative './clown'
require 'pry'

# NOTE: THIS IS A COMMAND LINE APPLICATION (NOT A WEB APPLICATION)

# GOAL - create a car
# Car.create({color: "Blue", mileage: 40000, capacity: 10})

# GOAL - create a clown

	# Step 1 - decide which object will have the others ID (what we call a 'foreign ID')
	# we decided the clowns will have the car's ID

	# Step 2 - create an Identity for the car whose ID we need to access to give to the clown

	# blue_car = Car.find_by("color", "Blue")
	# 	setting Car.find_by to blue_car allows us to access the data results

	# Clown.create({name: "Bozo", shoe_size: "XXXXL", car_id: blue_car["id"]})



# GOAL - find all clowns in a specific car
# Clown.select_by("car_id", blue_car["id"])
# THIS RETURNS THE ARRAY OF CLOWN HASHES THAT MATCH (with ALL the clown info)

# QUESTION - how would we return just the names of those clowns in the blue car?
# ANSWER - there is probably an example of them doing this in the html .erb file


# GOAL - find the car information for a clown

	# STEP 1 - identify the clown with a variable of its name - so we can reference any info that we get out of its hash
	# bozo = Clown.find_by("name", "Bozo")

	# STEP 2 - pull the actual car now that we know it's ID value from the clown hash
	# Car.find_by("id", bozo["car_id"]) - 
		# the first parameter item "id" is the key "id" and the second parameter item is a key that stands in for a value. 
		# the id of Bozo's car will match the regular 'id' of that car

binding.pry




