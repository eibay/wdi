require 'pry'

url = "/the_forest?animal=monkeys&food=bananas"

def parse_url(url)
  path = url.split("?")[0]
  # /the_forest
  query_string = url.split("?")[1]
  # animal=monkeys&food=bananas

  params = {}
  # params = empty hash
  params[:path] = path
  # :path = /the_forest

  pairs = query_string.split("&")
  #[0] "animal=monkeys"
  #[1] "food=bananas"

  key_values = []
  #empty array of key_values
  #when pushed will be filled with
  #[0]
      #[0]"animal"
      #[1]"monkeys"
  #[1]
      #[0]"food"
      #[1]"bananas"

  pairs.each do |pair|
  # each do - iterator (loop). Execute code for each element in pair
  # i.e. collection.each do |variable(call it whatever you want|
    key_values.push(pair.split("="))
  # splits the string in the variable 'pairs' and pushes it to the empty key_values array
   
  end

  query_params = {}
  #empty hash of query_params
  #when pushed will be filled with the following
  #{
  #  :animal => "monkeys",
  #   :food => "bananas"
  #}

  key_values.each do |key_value|
  # each do - iterator (loop). Execute code for each element in key_values
  # i.e. collection.each do |variable(call it whatever you want|
    query_params[key_value[0].to_sym] = key_value[1]
  #converts the string of [0] key_value to symbol
 
  end
  # binding.pry

  params[:query_params] = query_params
  #:query_params=>{:animal=>"monkeys", :food=>"bananas"}}

  return params
end

puts parse_url(url)