require_relative ("./dog")


comedians = []



com1 = Comedian.new("Aziz", "I went to a place recently I think is one of the most f**ked up places I've ever been to. I'm convinced this place is the epitome of American excess, of American greed. I'm talking about a place called Cold Stone Creamery. Whoa. If you have not been there, the basic gist of Cold Stone is that they take ice cream and then they just go ape sh*t with it.")
com2 = Comedian.new("Louie CK", "My bank is the worst. They are screwing me. You know what they did to me? They're charging me money for not having enough money. Apparently, when you're broke, that costs money.")
com3 = Comedian.new("Chris Rock", 'You know what they say, “There’s no reason to ever hit a woman.” Shit! There’s a reason to hit everybody. You just don’t do it. Shit, there’s a reason to kick an old man down a flight of stairs. You just don’t do it. Ain’t nobody above an ass-whooping.')

comedians.push(com1, com2, com3)

comedians.each do |a|
	puts a.tell_joke
end 