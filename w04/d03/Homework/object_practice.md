##Week04-Day03
---
###Classes
**Part 1**
- Create a `Taxi` class with the attributes - `driver_name, city, color`
- Add a method that returns all of the attributes to the terminal as a string

**Part 2**
- Create a `User` class with the attributes - `first_name, last_name, gender, city, state`
- Add an instance method called `greeting`
  - It should have the instance "introduce" itself by returning it's full name and city
- Add a class method `random_user` that makes a HTTP request to http://randomuser.me/
  - HINT:
  - ```
  HTTParty.get("http://api.randomuser.me/'")
  ```
  - The method should return the hash
- Bonus:
  - Have the class method also use the information from the HTTParty request to create new instances of `User` using the random information
