# path = "/the_forest?animal=monkeys&food=bananas"
# path1 = path.split("/")
# path2 = path1[1].split("?")
# #path2[0] = the_forest
# path3 = path2[1].split("=")
# #path3[0] = animal path3[2] = bananas
# path4 = path3[1].split("&")
# #patt4[0] = monkey path4[1] = food

# Values= {}
# Values[:path] = path2[0]
# Values[:query_params] = {}
# Values[:query_params][path3[0].to_sym] = path4[0]
# Values[:query_params][path4[1].to_sym] = path3[2]

# puts Values

# #output
# #{
# #:path=>"the_forest", 
# #:query_params=>
# # {
# # :animal=>"monkeys", 
# # :food=>"bananas"
# # }
# # }

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


params

{
            :path => "/the_forest",
    :query_params => {
        :animal => "monkeys",
          :food => "bananas"
    }
}
 
puts parse_url(url)
 
# Take ^, and turn into V
 
# {
#   path: "the_forest",
#   query_params: {
#     animal: "monkeys",
#     food: "bananas"
#   }
# }