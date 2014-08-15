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