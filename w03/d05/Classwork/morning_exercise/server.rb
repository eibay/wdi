require 'pry'

list = []
character = {}
onefivezero = []
ten = []
dr = []


html = File.read('greys.txt')
html = html.split("\n")

html.each do |thing|
	thing = thing.split(",")
	character[:character] = thing[1]
	character[:actor] = thing[0]
	character[:episodes] = thing[2]
	binding.pry
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

# binding.pry

# list.each do |thing|
# 	thing = thing[:episodes].split(' ')[0].to_i
# 	if thing > 150
# 		onefivezero << thing
# 	elsif thing < 10
# 		ten << thing
# 	end
# end

list.each do |thing|
	if thing[:character].include?("Dr")
		dr << thing
	end
end

