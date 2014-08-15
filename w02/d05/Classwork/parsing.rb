require 'pry'

path = "/the_forest?animal=monkey&food=bananas"


hash = {}

new_path = path.split("/")[1].split("?")[0] #"the_forest"

hash[:path] = new_path

query_hash = {}

query_params = path.split("?")[1].split("&") #[0] "animal=monkey"
#[1] "food=bananas"



monkeys = query_params[0].split("=")[1] #monkey

bananas = query_params[1].split("=")[1] #banana

query_hash[:animal] = monkeys #monkey
query_hash[:food] = bananas #banana

hash[:query_params] =  query_hash

puts hash

#binding.pry


# {
#   path: "the_forest",
#   query_params: {
#     animal: "monkeys",
#     food: "bananas"
#   }
# }

