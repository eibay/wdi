require 'pry'

greys_data = File.read('./greys.txt')
grey_data_split = greys_data.split("\n")

grey_data_array= []
grey_data_split.each do |a|
	actor_hash = {}
	grey = a.split(',')
	actor_hash["actor"] = grey[0]
	actor_hash["character"] = grey[1]
	actor_hash["episodes"] = grey[2].split(" ")[0].to_i

	if grey[3].include?("-")
		dates = grey[3].split("-")
		actor_hash["start year"] = dates[0].to_i
		actor_hash["end year"]= dates[1].to_i
	else
		actor_hash["start year"]= grey[3].to_i
		actor_hash["end year"]= grey[3].to_i
	end
	grey_data_array.push actor_hash
end

stars = []

grey_data_array.each do |actor|
	if actor
binding.pry