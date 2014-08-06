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
even_nos = []

while index < users[:jeff][:favorite_numbers].length
	if users[:jeff][:favorite_numbers][index] % 2 == 0
	even_nos.push(users[:jeff][:favorite_numbers][index])
	end
  index += 1
end

print even_nos