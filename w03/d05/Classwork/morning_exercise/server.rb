require 'pry'

greys = File.read("./greys.txt")
greys_split_line = greys.split("\n") 

greys_split_comma = []
greys_split_line.each do |a|
	greys_split_comma.push a.split(",")
end


greys_split_comma_dash= []
greys_split_comma.each do |a|
	if a[3].include?("-")
	greys_split_comma_dash << a[3].split("-")
end 
end

characters = []
greys_split_comma.each do |a|
	hash = {}
	hash[:actors] = a[0]
	hash[:character] = a[1]
	hash[:episodes] = a[2] 

	if a[3].include?("-")
		years = a[3].split("-") 
		hash[:start_date] = years[0]
		hash[:end_date] = years[1]
	else 
		hash[:start_date] = a[3]
		hash[:end_date] = a[3]
	end
	characters.push hash
end
# Create an array with the names of all the actors who have acted in more than 150 episodes.
stars = []
characters.each do |a|
	if a[:episodes].split(' ')[0].to_i > 150
		stars <<  a[:character]
	end
end
# puts stars

#Count how many actors have been in less than 10 episodes.
minor_peeps = []
characters.each do |a|
	if a[:episodes].split(' ')[0].to_i > 10
		minor_peeps <<  a[:character]
	end
end
# puts minor_peeps


# Create an array of all the character's with the word "Dr." in their title.


doctors=[]
characters.each do |a|
	if a[:character].include?("Dr.")
		doctors.push a[:character]
	end
end
# puts doctors


#2007: Create an array of all the characters who were on the show in 2007. (NOTE - they may have started before 2007 and ended afterwards.)
on_in_07=[]
characters.each do |a|
	if a[:start_date].to_i <= 2007 && a[:end_date].to_i >= 2007
		on_in_07.push a[:character]
	end
end
# puts on_in_07



			



