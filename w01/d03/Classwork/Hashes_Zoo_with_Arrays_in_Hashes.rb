#Zoo Hash
#add zoo animals one by one into the hash

# key = lion
# value = ("Leo", "Lyle", "Lara")

#to add them when initializing/creating the hash zoo_animals:
zoo_animals = {lions: ["Leo", "Lyle", "Lara"]}
puts "#{zoo_animals}"

#to add additional animal category to the hash:
zoo_animals[:tigers] = []
puts "#{zoo_animals}"

#to add additional animals to the tiger category of the hash:
zoo_animals[:tigers] = ["Tony", "Tasha"]
puts "#{zoo_animals}"

