require 'pp'

def blah
	puts "" 
end 

puts "Let's learn about hashes!", ""

emails = {}

pp emails; blah 

load = %w(emails["Harry\ Potter"]\ =\ "harry.potter@hogwarts.edu"
	emails["Hermione\ Granger"]\ =\ "hermione.granger@hogwarts.edu"
	emails["Ronald\ Weasley"]\ =\ "ronald.weasley@hogwarts.edu"
	emails["Arthur\ Weasley"]\ =\ "arthur_weasley@ministryofmagic.gov.uk"
	emails["Mr.\ Garrick"]\ =\ "garrick@olivanderswands.co.uk") 

pp load; blah 

load.each do |e|
	eval e 
	pp emails 
	blah 
end

pp emails.key "hermione.granger@hogwarts.edu"; blah 


puts <<INSTRUCTIONS
What to do? 
1. You must make a zoo hash
2. You must add 5 animals to it 
3. The animals have names 
3. Practice recalling the animal 

INSTRUCTIONS

mkzoo = "$zoo = {}" 

animals = 'animals = [["Mr. Toby", :goldfish], ["Mrs. Susan", :goldfish], ["Damn", :sea_lion], ["Fido", :anthropod], ["Dragon", :plant]]'

truck = <<LOAD_IN_LOAD_OUT 
animals.each do |animal|
	$zoo[animal[0]] = animal[1]
end 
LOAD_IN_LOAD_OUT


puts "\nFirst we make the zoo hash:", mkzoo 

eval mkzoo 

puts "\nThen we add the five animals:", animals 

eval animals 

puts "\nFinally, we add them to the zoo:", truck 

eval truck 

puts "\nThat gives us this beautiful hash:", "" 

pp $zoo 

puts "Now...", "\nWe can do things w/ it!"

doings = %w($zoo["Mr.\ Toby"];\ $zoo["Mrs.\ Susan"])

p doings 

doings.each do |doing|
	pp doing
	eval doing  
end 