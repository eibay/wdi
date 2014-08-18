require 'httparty'
require 'pry'
require 'json'
require 'socket'
# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:elvis&fmt=json", headers: {"User-Agent" => "Httparty"})

# url = "/the_forest?animal=monkeys&food=bananas"
# equivalent to while true
def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

  if query_string == nil
    return params
  end

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

url = "/the_forest?animal=monkeys&food=bananas"
params = parse_url(url)

puts params

url = "/the_forest?animal=monkeys&food=bananas"
{:path=>"/the_forest", :query_params=>{:animal=>"monkeys", :food=>"bananas"}}

require 'httparty'
require 'pry'
require 'json'
require 'socket'


    omdbapi = TCPSocket.new 'www.omdbapi.com', 80
    omdbapi.puts "GET /?s=banana"
    response = omdbapi.gets
    omdbapi.close
    parsed = JSON.parse(response)
    








