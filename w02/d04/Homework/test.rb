  require 'socket'
  require 'pry'
  require 'json'

  client = TCPSocket.new 'www.omdbapi.com', 80
  client.puts 'GET /?s=monkey'

  response = client.gets
  binding.pry
  puts response

#server_response = JSON.parse(response)
#OMDB returns a strong, which we parse through with JSON.parse
#This gives us a ruby hash (which we assign to a variable)
#This ruby hash has one key, value pair...
#}
#  "Search" => [ {"title" => "Iron Monkey"} #"An array of hashes"]
#}
# You're .eaching over the array: server_response["Search"]
# server_response["Search"].length == 10
# server_response["Search"].each do |x| puts x end
#This gives us:
# {"Title"=>"Iron Monkey", "Year"=>"1993", "imdbID"=>"tt0108148", #"Type"=>"movie"} x10 This is a hash that contains all the movie info for each query string match (monkey)
#
# server_response["Search"][8]  gives you one movie match
#EXAMPLE
#server_response["Search"][8] == {
    #  "Title" => "The Monkey King",
    #   "Year" => "2014",
    # "imdbID" => "tt1717715",
    #   "Type" => "movie"
    #}
#server_response["Search"][8]["Title"] == "The Monkey King"

j = 0
while j < server_response["Search"].length
  puts server_response["Search"][j]["Title"]
  puts server_response["Search"][j]["Year"]
  puts server_response["Search"][j]["imdbID"]
  j += 1
end

## YIELDS ##
# Iron Monkey
# 1993
# tt0108148
# Monkey Business
# 1952
# tt0044916
# Monkey Business
# 1931
# tt0022158
# x7...
