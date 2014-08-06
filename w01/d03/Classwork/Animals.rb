# zoo={}
# mammals=[]
# reptiles=[]

# zoo[:mammals]=[]
# zoo[:reptiles]=[]

# zoo[:mammals].push("dog","cat","gorilla")
# zoo[:reptiles].push("snake","aligator")

# zoo[:mammals] << "Tejal"

# specific=zoo[:mammals].index("Tejal")
# puts specific


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

   # users["sean"] = users[:sean]
   # then delete users.delete(:sean)

    numbers=[]
    index=0
    puts numbers

    while index < 3

    	number_a = users[:jeff][:favorite_numbers][index]
    	index += 1
    	if number_a % 2==0
    		numbers << number_a
    	end
    end



