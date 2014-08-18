
require 'pry'
# we want to create the ff hash:
# {
# 	path: "the_forest",
# 	query_params: {
# 		animal: "monkeys",
# 		food: "bananas"
# 	}
# }
url = "/the_forest?animal=monkeys&food=bananas"

	def parse_url(url)
	path = url.split("?")
	parameters = path[1].split("&")
	each_parameter = []
	parameters.each {|pair| each_parameter << pair.split("=")}


	parsed_url = {}
	parsed_url[:path] = path[0]
	parsed_url[:query_params] = {}

	each_parameter.each do |first_thing, second_thing|
		parsed_url[:query_params][first_thing.to_sym] = second_thing
	end

	return parsed_url

end

 
