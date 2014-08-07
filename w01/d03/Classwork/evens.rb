users = {
      jeff: {
        github: "jkonowitch",
        favorite_numbers: [12, 42, 75]
      }
    }

index = 0

while index < users[:jeff][:favorite_numbers].length  
	if users[:jeff][:favorite_numbers][index] %2 == 0
	puts users[:jeff][:favorite_numbers][index]
	end
index += 1

end