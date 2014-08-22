require "pry"

full_greys_array = File.read("./greys.txt")

full_character_strings = full_greys_array.split("\n")

array_of_arrays = []

full_character_strings.each do |full_character_string|
	array_of_arrays << full_character_string.split(",")
end

greys_array_of_hashes = []

array_of_arrays.each do |profile_array|
	profile = {}
	profile[:actor] = profile_array[0]
	profile[:character] = profile_array[1]
	profile[:episodes] = profile_array[2].split(" ")[0].to_i
	if profile_array[3].length == 4
		profile[:start_year] = profile_array[3].to_i
	else
		years = profile_array[3].split("-")
		profile[:start_year] = years[0].to_i
		profile[:end_year] = years[1].to_i
	end
	greys_array_of_hashes << profile
end

stars = []

greys_array_of_hashes.each do |x|
	if x[:episodes] > 150
		stars << x[:actor]
	end
end

minor_peeps = []
greys_array_of_hashes.each do |x|
	if x[:episodes] < 10
		minor_peeps << x[:actor]
	end
end

doctors = []
greys_array_of_hashes.each do |x|
	if x[:character].include?("Dr.")
		doctors << x[:character]
	end
end


year_characters = []

greys_array_of_hashes.each do |x|
	year = 2007
	if x.include?(:end_year)
		if x[:start_year] <= year && x[:end_year] >= year
			year_characters << x[:character]
		end
	else
		if x[:start_year] == year
			year_characters << x[:character]
		end
	end
end

puts "The stars of the show are: #{stars.join(', ')}."
puts "The number of minor characters is #{minor_peeps.length}."
puts "The doctors on the show are: #{doctors.join(', ')}."
puts "The characters featured on the show in 2007 are: #{year_characters.join(', ')}."



