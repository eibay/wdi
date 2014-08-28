require_relative "./comedians"
mitch=Comedian.new("name","age","fav_joke")
mitch.name="mitch"
mitch.age=37
mitch.favorite_joke="blah blah blah"
comedians=[Comedian.new("Lars", 87, "Yo momma so fat she has a high likelihood of dying of heart disease, the leading cause of death of women in America. Tell her to diet and exercise before it is too late."), Comedian.new("Stefan" , 91, "I like stairs"), Comedian.new("Patendo" , 99, "I don't like stairs, I'm very old and have trouble walking up and down"), mitch]

comedians.each do |comedian|

	comedian.fav_joke
end

list_all_students(students)
end
