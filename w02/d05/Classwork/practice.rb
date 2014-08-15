require 'pry'

# path = "/the_forest?animal=monkey&food=bananas"

# path = path.split("/")
# path_first = path[1].split("?")
# query = []
# result = {}
# result[:path] = path_first[0]

# path_second = path_first[1].split("&")
# path_second.each { |something|
# 	query << something.split("=")
# }

# # query.each { |one|
# # 	one = one.to_ary
# # 	one = one[0]>to_hash
# # 	one = one
# # }

# query = Hash[query]
# # query["monkey"] = query["animal"].to_sym
# # query["food"] = query["food"].to_sym

# result[:query_paramas] = query

# # binding.pry

# # print path_first
# # print path_second

# print result

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

  binding.pry
 
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
