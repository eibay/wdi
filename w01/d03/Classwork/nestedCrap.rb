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

    users[:neel][:favorite_numbers].push(7)

    :favorite_numbers.push(7)

# How would you access Jeff's Github handle (i.e. the string "jkonowitch")?
  users[:jeff][:github]
# How would you add the number 7 to Neel's favorite numbers?
  users[:neel][:favorite_numbers].push(7)
# How would you add yourself to the users hash?

  users[:jill] = {
        github: "jillo",
        favorite_numbers: [1, 2, 3]}

# How would you return the array of Sean's favorite numbers?
  users[:sean][:favorite_numbers]

  
# How would you return the smallest of Neel's favorite numbers?
  users[:neel][:favorite_numbers].sort


# How would you return an array of Jeff's favorite numbers that are also even?