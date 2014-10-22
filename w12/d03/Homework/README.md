# Hogwarts

The teachers are getting frustrated at managing house points, and this magic thing just isn't cutting it. Let's use Ruby to help them out.

Create three classes: `Student`, `House`, and `Hogwarts`. The code examples below demostrate the features of these objects.

## Student

```ruby
harry = Student.new("Harry Potter")
harry.name
#=> "Harry Potter"

harry.points
#=> 0

harry.award_points(10)
harry.points
#=> 10
```

## House

```ruby

gryffindor = House.new("Gryffindor")

gryffindor.add_student(harry)

gryffindor.students
#=> [<#Student @name="Harry Potter">] 

gryffindor.get_student("Harry Potter")
#=> <#Student @name="Harry Potter">

gryffindor.get_student("Harry Potter").points
#=> 10

hermione = Student.new("Hermione Granger")
hermione.award_points(400)
gryffindor.add_student(hermione)

gryffindor.total_points
#=> 410
```

## Hogwarts

```ruby
var hogwarts = new Hogwarts()

slytherin = House.new("Syltherin")

hogwarts.add_house(gryffindor)
hogwarts.add_house(slytherin)

hogwarts.house_totals
#=> { "Gryffindor" => 410, "Slytherin" => 0 }

draco = Student.new("Draco Malfoy")
draco.award_points(40)
syltherin.add_student(draco)

hogwarts.house_totals
#=> { "Gryffindor" => 410, "Slytherin" => 40 }
```

### API-ify

Using the behavior above as a guide, use ActiveRecord and Rails to create a JSON API that would allow teachers to manage points for their students and view information about house totals. Use HTTParty or request (node.js) to hit your API.

### Bonus

Secure your API with an authentication token. All API requests should pass a correct token to the server in order to be considered "authenticated".
