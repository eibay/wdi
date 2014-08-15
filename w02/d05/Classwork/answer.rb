path = "/the_forest?animal=monkey&food=bananas" 
def parse_url(url)
	path= url.split("?")[0]
	query_string= url.split("?")[1]

	pairs=query_string.split("&")

	key_values=[]

	pairs.each do |pair|
		key_values.push pair.split("=")
	end

	query_params = {}

	key_values.each do |key_values|
		query_params[key_values[0].to_sym] = key_values[1]
	end

	params = {
		path: path,
		query_params: query_params
	}

	return params
end 
puts parse_url(path)
