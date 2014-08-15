require 'pry'
route = "/the_forest?animal=monkeys&food=bananas"



hash = {}

path = route.split("?")[0].split("/")[1].to_s
hash[:path] = path


query_params = {}

animal = route.split("=")[1].split("&")[0].to_s
query_params[route.split("?")[1].split("=")[0].to_sym] = animal
# query_params[:animal] = animal

food = route.split("=")[2].to_s

query_params[route.split("&")[1].split("=")[0].to_sym] = food
# query_params[:food] = food

hash[:query_params] = query_params

puts hash




def query_string_single(route)
	hash = {}
	# path = route.split("?")[0].split("/")[1]
	# "/the_forest?animal=monkeys" > "the_forest"
	
	query = route.split("?")[1].split("=")[0]
	# "/the_forest?animal=monkeys" > "animal"

	string = route.split("=")[1].to_s
	# "/the_forest?animal=monkeys" > "monkeys"
	hash[query.to_sym] = string

	puts hash
	return hash

end

hash1 = query_string_single("/the_forest?animal=monkeys")





def query_string_infinitum(route, queries)
	hash = {}
	n = 0

	while n < queries do
		query = route.split("?")[1].delete('"').split("=")[n]
		query = query.split("&")[1].to_s unless n == 0


		string = route.split("=")[n+1].delete('"')
		string = string.split("&")[0].to_s unless n + 1 == 0


		hash[query.to_sym] = string
		
		n += 1
	end
	puts hash
	return hash
end



hash1 = query_string_infinitum("/the_forest?animal=monkeys&food=bananas", 2)
hash2 = query_string_infinitum("/the_forest?animal=monkeys&food=bananas&pokemon=pikachu", 3)
hash3 = query_string_infinitum("/the_forest?animal=monkeys&food=bananas&pokemon=pikachu&book=thelittleprince", 4)



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
