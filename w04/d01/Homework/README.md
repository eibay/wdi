##Week04-Day01

---
###Garage
- **GOAL**: Build a server that allows us to add new Mechanics and Cars

- **SPEC**: Create all the necessary routes and views so that I can do the below:
  - *Mechanic*:
    - Add Mechanic information into a form - `name, age, favorite car`
    - Have that information be persistent
    - See all of my mechanics listed on a page
    - Search for mechanics by name ***or*** favorite car

  - *Car*:
    - Add Car information into a form - `make, model, color`
    - Have that information be persistent
    - See all of my cars listed on a page
    - Search for cars by make ***or*** model
      - What happens if the you search for a make or model and there is more than one in your array? I.E. you are searching for `toyota` and your array has information for both a `corolla` and a `camry`

- **DETAILS**:
  - Make sure you are using 2 separate files to handle your persistance
  - Be sure to use classes and class methods
    - Use `require_relative` so that your classes can placed in a `lib` folder, but are still accessible in your `server.rb`

######################################################################    
    
    
- **BONUS**:
  - We should already have two pages to list all our items; one for cars and one for mechanics
    - Update these pages so that they only list name of each mechanic and the model of each car
    - Have every element in the list be a link that leads to a separate view which will show us the details of that item
      - i.e. The mechanics list will only have their names, while clicking on their name will lead me to a view which displays the name, age and favorite car of that particular mechanic
  - Add a class method to your Mechanic class so that you create a random Mechanic using the `http://randomuser.me/` API
    - Not all of the attributes for a Mechanic are provided by the API, so have the unprovided attributes be assigned randomly
    - Add a button to your view so that pressing it will add 5 new Mechanics by using this class method
    - Display the pictures that the API provides for the mechanics
- **SUPER BONUS**:
  - Can you devise a way for the mechanics to be working on (assigned to) a specific car?
  - What would have to change in your application to facilitate this?
      - Hint: Start by thinking about your data structure.
  - Make a copy of your HW and work on the copy for this bonus, do NOT work on the original file
