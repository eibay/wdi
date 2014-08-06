# harry.potter@hogwarts.edu
# hermione.granger@hogwarts.edu
# ronald.weasley@hogwarts.edu
# arthur_weasley@ministryofmagic.gov.uk
# garrick@olivanderswands.co.uk

zoo = {
	"Scar" => "Lion",
	"Rajah" => "Tiger",
	"Neo" => "Parakeet",
	"Buster" => "Rabbit",
	"Oliver" => "Girrafe",
	"Thomas" => "Sea Turtle"
}

puts zoo
puts
puts "#{zoo.key("Lion")} loves to talk to #{zoo.key("Rabbit")} but #{zoo.key("Rabbit")} is always nervous around him..."
puts

while zoo.length < 6
	puts "#{zoo.each |key, value| puts #{key}: #{value}}
end