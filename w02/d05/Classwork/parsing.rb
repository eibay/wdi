<<<<<<< HEAD
url = "/the_forest?animal=monkeys&food=bananas"

def parse_url(url)

  path = url.split("?")[0]
  query_string = url.split("?")[1]

=======
require 'pry'

url = "/the_forest?animal=monkeys&food=bananas"

def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path
>>>>>>> 8a8c1869cba4449d527bf1f17f53f92404567841

  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end

<<<<<<< HEAD
  params = {
    path: path,
    query_params: query_params
  }
=======
  params[:query_params] = query_params
>>>>>>> 8a8c1869cba4449d527bf1f17f53f92404567841

  return params
end

<<<<<<< HEAD
puts parse_url(url)

# Take ^, and turn into V

# {
#   path: "the_forest",
#   query_params: {
#     animal: "monkeys",
#     food: "bananas"
#   }
# }
=======
puts parse_url(url)
>>>>>>> 8a8c1869cba4449d527bf1f17f53f92404567841
