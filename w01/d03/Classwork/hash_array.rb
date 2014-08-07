# array = [1, 2, 3, 4]

# index = 0

# while index < array.length
# 	if array(index) % 2 = 0
# 		puts array(index)
# 	end
# 	index += 1
# end


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

 index = 0

 while index < users[:jeff][:favorite_numbers].length
 	if users[:jeff][:favorite_numbers][index] % 2 == 0
 		puts users[:jeff][:favorite_numbers][index]
 	end
 	index += 1
 end