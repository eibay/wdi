path = "/the_forest?animal=monkeys&food=bananas"


hash = {}

new_path = path.split("/")[1].split("?")[0]

hash[:path] = new_path


puts hash

query_hash = {}

query_params = path.split("?")[1].split("&")

monkeys = query_params[0].split("=")[1]
bananas = query_params[1].split("=")[1]

query_hash[:animal] = monkeys
query_hash[:food] = bananas

hash[:query_params] = query_hash

puts hash

# Using a method
# 

def key_values(x, y, query_params, index, hash_add)
	y = query_params[index].split("=")[1]
	hash_add[x.to_sym] = y
end

key_values("animal", "monkeys", query_params, 0, query_hash)
key_values("food", "bananas", query_params, 1, query_hash)

hash[:query_params] = query_hash

puts hash

# Jeff's process
# 

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




