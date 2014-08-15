url = "/the_forest?animal=monkeys&food=bananas"

def parse_url(url)

  path = url.split("?")[0]
  query_string = url.split("?")[1]


  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end

  params = {
    path: path,
    query_params: query_params
  }

  return params
end

puts parse_url(url)

# Take ^, and turn into V

# {
#   path: "the_forest",
#   query_params: {
#     animal: "monkeys",
#     food: "bananas"
#   }
# }



# ++++++++++++++++++=================

# hash = {
# 	path: "x",
# 	query_params: {
# 		animal: "y",
# 		food: "z"
# 	}
# }

# path = "/the_forest?animal=monkey&food=bananas"


# path_noslash = path.split('/')
# path_pieces = path_noslash[1].split('?')
# animal_food = path_pieces[1].split('&')
# animal = animal_food[0].split('=')
# food = animal_food[1].split('=')

# hash[:path] = path_pieces[0]
# hash[:query_params][:animal] = animal[1]
# hash[:query_params][:food] = food[1]

# # ------------------------------======

# path = "/the_forest?animal=monkey&food=bananas"

# path.split("/")
# path[1].split("?")

# # ------------------------------======

# path = "/the_forest?animal=monkey&food=bananas"

# path = url.split{"?"

