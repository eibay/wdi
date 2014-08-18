# path = "/the_forest?animal=monkeys&food=bananas"

# targ = {
# 	path: "the_forest",
# 	query_params: {
# 		animal: "monkeys",
# 		food: "bananas"
# 	}
# }

require 'pry'

def convert(str)
	path = str.split("?")
	query_split = path[1].split("&")
	amp_split = []
	query_split.each do |param|
		amp_split << param.split("=")
	end
	batch = {
		path: path[0][1..-1],
		query_params: {}
	}
	amp_split.each do |arr|
		batch[:query_params][arr[0].to_sym] = arr[1]
	end
	batch
end

