require 'pry'

url = '/artist?search_word=hot'
def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

    search_word = query_string.split("=")[0]
    search_value = query_string.split("=")[1]

  query_params = {}
  query_params[search_word.to_sym] = search_value

  params[:query_params] = query_params

  return params
end


puts parse_url(url)



url = "/the_forest?animal=monkeys&food=bananas" #url = response.split(' ')[1]


def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end

  params[:query_params] = query_params

  return params
end

puts parse_url(url)