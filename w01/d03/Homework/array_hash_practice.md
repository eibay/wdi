###Array and Hash access

**A. Copy and paste the following data structure into pry:**

`instructors_array = ["Sean", "Neel", "Jeff"]`

1. Use pry to access the string `"Neel"` #instructors_array[1] 
2. Use pry to add your name to the end of the array? #instructors_array.push("Tess")  
3. Use pry to remove `"Jeff"` from the array. #instructors_array.delete(2) 
4. Use pry to access the last item in the array. #instructors_array[-1] 

**B. Copy and paste the following data structure into pry:**

```
vladimir_putins_brain = { 
  launch_code: "a5Mjp257GHMGH23e5qxE", 
  fav_hobby: "Riding ponies", 
  prideful: true 
}
```

1. Use pry to return the string `"Riding ponies"` 
# vladimir_putins_brain[:fav_hobby] 

2. Use pry to return the string `"a5Mjp257GHMGH23e5qxE"`
#vladimir_putins_brain[:launch_code]

3. Use pry to add the key-value pair `"number_of_wishes" => "three"` to `vladimir_putins_brain` 
#vladimir_putins_brain[:number_of_wishes]="three"                                     
4. Use pry to add the key-value pair `4 => "four"`
#vladimir_putins_brain[4]="four" 

5. Use pry to remove the key-value pair `"prideful?" => true`
#vladimir_putins_brain.delete(:prideful) 

**C. Given the following data structure:**

`boolean_hash = { true => "It's true!", false => "It's false" }`

1. What is the return value of `boolean_hash[2 + 2 == 4]`?
#"It's true!"
2. What is the return value of `boolean_hash["Jeff" == "Neel"]`?
#It's false
3. What is the return value of `boolean_hash[9 > 10]`?
#It's false
4. What is the return value of `boolean_hash[0]`?
#nil ??
5. What is the return value of `boolean_hash["Neel"]`?
#nil
6. What is the return value of `boolean_hash[false||true]`?
#it's true
7. What is the return value of `boolean_hash[false||"Sean"]`?
# nil 
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

#users[:jeff][:github] 

2. How would you add the number 7 to Neel's favorite numbers?
# users[:neel][:favorite_numbers].push(7)  

3. How would you add yourself to the users hash?
#users[:tess] = {github: "", favorite_numbers: []}                                    

4. How would you return the array of Sean's favorite numbers
#users[:sean][:favorite_numbers] 

5. How would you return the smallest of Neel's favorite numbers?
#users[:neel][:favorite_numbers].min    

6. How would you return an array of Jeff's favorite numbers that are also even?
users[:jeff][:favorite_numbers].select {|number| number % 2 == 0}  
