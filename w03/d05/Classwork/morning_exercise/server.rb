require 'pry'

list = []
character = {}
onefivezero = []
twozerozeroseven = []
ten = []
dr = []


html = File.read('greys.txt')
html = html.split("\n")

html.each do |thing|
	thing = thing.split(",")
	character[:character] = thing[1]
	character[:actor] = thing[0]
	character[:episodes] = thing[2]
	if thing[3].include?("-")
		year = thing[3].split("-")
		character[:start_year] = year[0]
		character[:end_year] = year[1]
	else
		character[:start_year] = thing[3]
	end

	list << character
	character = {}
end

list.each do |thing|
	episodes_num = thing[:episodes].split(' ')[0].to_i
	if episodes_num > 150
		onefivezero << thing
	elsif episodes_num < 10
		ten << thing
	end
end

list.each do |thing|
	if thing[:character].include?("Dr.")
		dr << thing
	end
end

list.each do |thing|
	if thing[:start_year].to_i == 2007 || (thing[:start_year].to_i < 2007 && thing[:end_year].to_i > 2007)
		twozerozeroseven << thing
	end
end

binding.pry


puts onefivezero
puts ten
puts dr
puts twozerozeroseven

