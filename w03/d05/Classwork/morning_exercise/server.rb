require 'pry'

greys_data = File.read('./greys.txt')
grey = greys_data.split("\n")

characters = []
grey.each do |a|
	grey_hash = {}
	character = a.split(',')
	grey_hash["actor"] = character[0]
	characters.push grey_hash
end

binding.pry