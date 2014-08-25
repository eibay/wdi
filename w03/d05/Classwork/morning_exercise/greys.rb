require 'pry'


str = File.read('greys.txt')

cast = []

index = 0

str.split("\n").each do |data|
	actor = data.split(",")
	cast << {
		actor: actor[0],
		character: actor[1],
		episodes: actor[2].split(" ")[0].to_i
	}
	if actor[3].include?("-")
		cast[index][:start_year] = actor[3].split("-")[0].to_i
		cast[index][:end_year] = actor[3].split("-")[1].to_i
	else
		cast[index][:start_year] = actor[3].to_i
		cast[index][:end_year] = actor[3].to_i
	end
	index += 1
end

greater_than = []
cast.each do |actor|
	if actor[:episodes] > 150
		greater_than << actor[:actor]
	end
end

less_than = []
cast.each do |actor|
	if actor[:episodes] < 10
		less_than << actor[:actor]
	end
end

doctors = []
cast.each do |actor|
	doctors << actor[:character] unless actor[:character].scan(/Dr\./).empty?
end

aught_seven = []

cast.each do |actor|
	aught_seven << actor[:character] if actor[:start_year] == 2007
	if actor[:start_year] < 2007 && actor[:end_year] >= 2007
		aught_seven << actor[:character]
	end
end


binding.pry