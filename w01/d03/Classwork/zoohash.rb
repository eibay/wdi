###Array and Hash access

**A. Copy and paste the following data structure into pry:**

`instructors_array = ["Sean", "Neel", "Jeff"]`

1. Use pry to access the string `"Neel"`
2. Use pry to add your name to the end of the array?
3. Use pry to remove `"Jeff"` from the array.
4. Use pry to access the last item in the array. 

**B. Copy and paste the following data structure into pry:**

```
vladimir_putins_brain = { 
  launch_code: "a5Mjp257GHMGH23e5qxE", 
  fav_hobby: "Riding ponies", 
  "prideful?": true 
}
```

1. Use pry to return the string `"Riding ponies"`
pry(main)> vladimir_putins_brain[:fav_hobby]  

2. Use pry to return the string `"a5Mjp257GHMGH23e5qxE"`

3. Use pry to add the key-value pair `"number_of_wishes" => "three"` to `vladimir_putins_brain`
vladimir_putins_brain[:number_of_wishes] = ["three"] 

4. Use pry to add the key-value pair `4 => "four"`
5. Use pry to remove the key-value pair `"prideful?" => true`

**C. Given the following data structure:**

`boolean_hash = { true => "It's true!", false => "It's false" }`

1. What is the return value of `boolean_hash[2 + 2 == 4]`?
2. What is the return value of `boolean_hash["Jeff" == "Neel"]`?
3. What is the return value of `boolean_hash[9 > 10]`?
4. What is the return value of `boolean_hash[0]`?
5. What is the return value of `boolean_hash["Neel"]`?
6. What is the return value of `boolean_hash[false||true]`?
6. What is the return value of `boolean_hash[false||"Sean"]`?

### Arrays & Hashes
**Given the following data structure:**
```ruby
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
```

1. How would you access Jeff's Github handle (i.e. the string "jkonowitch")?
users[:jeff][:github] 

2. How would you add the number 7 to Neel's favorite numbers?
users[:neel][:github].push(7) 

3. How would you add yourself to the users hash?
users.push("Jeffrey") 

4. How would you return the array of Sean's favorite numbers?
pry(main)> users[:neel][:favorite_numbers]   

5. How would you return the smallest of Neel's favorite numbers?
pry(main)> users[:neel][:favorite_numbers].min 

6. How would you return an array of Jeff's favorite numbers that are also even?
users[:jeff][:favorite_numbers].each {|n| puts n if n % 2 == 0} 
12
42
=> [12, 42, 75]

