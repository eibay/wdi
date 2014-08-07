###Array and Hash access

# **A. Copy and paste the following data structure into pry:**

# `instructors_array = ["Sean", "Neel", "Jeff"]`

# 1. Use pry to access the string `"Neel"`
	#[3] pry(main)> instructors_array[1] 

# 2. Use pry to add your name to the end of the array?
	#[4] pry(main)> instructors_array.push("Andrea")  

# 3. Use pry to remove `"Jeff"` from the array.
	#[5] pry(main)> instructors_array.delete("Jeff")  

# 4. Use pry to access the last item in the array.

# 	[7] pry(main)> instructors_array[instructors_array.length - 1]             
	#  Pry returns => "Andrea"

	# array.length gives us the number of items in an array.
	# [array.length - 1] returns the value / name of the item in the last spot on the array. 
	# We use -1 because the array index starts at 0, while length starts at 1 

	# [8] pry(main)> instructors_array.last                                      
	# => "Andrea"
	# This is a method that is simpler to use than the formula above. 
	# It just pulls the last value from the array.

#----------

# B. Copy and paste the following data structure into pry:

# vladimir_putins_brain = { 
#   launch_code: "a5Mjp257GHMGH23e5qxE", 
#   fav_hobby: "Riding ponies", 
#   prideful: true 
# }
# Use pry to return the string "Riding ponies"

	#[11] pry(main)> vladimir_putins_brain[:fav_hobby]
	#don't forget the : that stands for symbol, 
	#otherwise it will look for a variable which we don't have


# Use pry to return the string "a5Mjp257GHMGH23e5qxE"
	#[12] pry(main)> vladimir_putins_brain[:launch_code] 

# Use pry to add the key-value pair "number_of_wishes" => "three" to vladimir_putins_brain
#my first thought is to use: vladimir_putins_brain.push - 
#you would NOT use this - .push is only for arrays.
#you CAN push an array value into an array value within a hash
	
	#CORRECT ANSWER:
# 	[13] pry(main)> vladimir_putins_brain["number_of_wishes"] = "three"        
# => "three"

# Use pry to add the key-value pair 4 => "four"

	# [15] pry(main)> vladimir_putins_brain[4] = "four"                          
	# => "four"

	#Dummy check to see if its added
	# [16] pry(main)> vladimir_putins_brain                                      
	# => {:launch_code=>"a5Mjp257GHMGH23e5qxE",
	#  :fav_hobby=>"Riding ponies",
	#  :prideful=>true,
	#  "number_of_wishes"=>"three",
	#  4=>"four"}

# Use pry to remove the key-value pair :prideful => true

	# [17] pry(main)> vladimir_putins_brain.delete(:prideful)                    
	# => true

	#Dummy check to see if its removed
	# [18] pry(main)> vladimir_putins_brain                                      
	# => {:launch_code=>"a5Mjp257GHMGH23e5qxE",
	#  :fav_hobby=>"Riding ponies",
	#  "number_of_wishes"=>"three",
	#  4=>"four"}

#----------

# C. Given the following data structure:

# boolean_hash = { true => "It's true!", false => "It's false" }


# What is the return value of boolean_hash[2 + 2 == 4]?

		#answer to the math = true so return value ==> "It's true!"

# What is the return value of boolean_hash["Jeff" == "Neel"]?

		#false so "it's false"


# What is the return value of boolean_hash[9 > 10]?

		#false so "it's false"

# What is the return value of boolean_hash[0]?

			#nil (because there's no key value of '0' in the hash?)


# What is the return value of boolean_hash["Neel"]?

# I thought answer = true, but answer is nil. 
	#(because there's no key value of '0' in the hash?)


# What is the return value of boolean_hash[false||true]?

	#true so return value ==> "It's true!"


# What is the return value of boolean_hash[false||"Sean"]?

# I think that because there IS a key value of false, then 'false' is truthy. 
# computer returns the value false because it is truthy and 
# Sean, which is not a key value is false, or returns 'nil'

#QUESTION: does computer choose true over nil, or does it just return nil?
#ANSWER: it seems to return nil, but why?

#REAL ANSWER - We evaluate the info in the [] first, irrespective of the hash
#that is encompassing it. 
#So, with NO context, false is just false, 
#and "Sean" as a standalone variable is true
#THEN when you put the resulting value "Sean" in boolean_hash as a key:
#boolean_hash["Sean"] we get => nil, because Sean is not a key in this hash! 


#----------
 D. Arrays & Hashes
Given the following data structure:

    users = {
      jeff: {
        github: "jkonowitch",
        favorite_numbers: [12, 42, 75]
      },
      neel: {
        github: "darthneel",
        favorite_numbers: [11, 99, 24]
      },
      sean: {
        github: "sean-west",
        favorite_numbers: [17, 13, 21]
      }
    }
How would you access Jeff's Github handle (i.e. the string "jkonowitch")?
How would you add the number 7 to Neel's favorite numbers?
How would you add yourself to the users hash?
How would you return the array of Sean's favorite numbers?
How would you return the smallest of Neel's favorite numbers?
How would you return an array of Jeff's favorite numbers that are also even?




#----------














