# harry.potter@hogwarts.edu
# hermione.granger@hogwarts.edu
# ronald.weasley@hogwarts.edu
# arthur_weasley@ministryofmagic.gov.uk
# garrick@olivanderswands.co.uk

zoo = {
	"Lyle" => "Giraffe",
	"Belmont" => "Flamingo",
	"Michael" => "Llama",
	"Peter" => "Tree Frog",
	"Edsel" => "Elephant"
}

zoo["Sam"] = "Lion"
zoo["Yogi"] = "Bear"

puts zoo

fav_artists = { Radiohead: "OK Computer", Radiohead: "In Rainbows" }
# NOOOOOOO

fav_artists = {Radiohead: ["OK Computer", "In Rainbows"]}
# That'll work

fav_artists[:Beatles] = []

fav_artists[:Beatles].push("The White Album")

fav_artists[:Beatles] << "Sgt Peppers"

fav_artists[:Beatles].push("Revolver", "Help")


C1. It's true!
C2. It's false!
C3. It's false!
C4. nil
C5. nil
C6. It's true!
C7. nil

D1. users[:jeff][:github]
D2. users[:neel][:favorite_numbers].push(7)
D3. users[:dan] = {
	github: "DanielFarber",
	favorite_numbers: [7, 11, 21, 9]
}
D4. users[:sean][:favorite_numbers]
D5. users[:neel][:favorite_numbers].min
D6. index = 0
even_numbers = []
while index < users[:jeff][:favorite_numbers].length
	this_example = users[:jeff][:favorite_numbers][index]
	if this_example.even?
		even_numbers.push(this_example)
	end
	index += 1
end
even_numbers