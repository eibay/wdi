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

num_index = 0
even = []
while num_index < users[:jeff][:favorite_numbers].length
  num = users[:jeff][:favorite_numbers][num_index]
  if num % 2 == 0
    even.push(num)
    num_index += 1
  else
    num_index += 1
  end
end
puts even