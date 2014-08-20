require 'pry'
require 'httparty'

server = TCPServer.new 2000

def parse_url(url)
  path = url.split("?")[0]
  query_string = url.split("?")[1]

  params = {}
  params[:path] = path

  if query_string == nil
    return params
  end # ends query_string conditional if statement

  pairs = query_string.split("&")

  key_values = []

  pairs.each do |pair|
    key_values.push(pair.split("="))
  end #ends pairs.each block

  query_params = {}

  key_values.each do |key_value|
    query_params[key_value[0].to_sym] = key_value[1]
  end #ends key_values.each block

  params[:query_params] = query_params
  return params

end #ends parse_url method

loop do
  client = server.accept
  request = client.gets
  url = request.split(" ")[1]
  params = parse_url(url) #The thing in the () shld b named path bc it is not actually
  # the url since whats being passed is not a url but a path since the domain name is not part
  # of it.

  if params[:path] == "/"
    html = File.read("./views/index.html")
    client.puts html
  elsif params[:path] == "/tags"
    search_result = params[:query_params][:category_name]
    response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_result}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

  images = File.read("./views/tags.html")

  # images = images.gsub("{{search_result}}", search_result)

  client.puts images


  # tags_list = []
  # binding.pry
  response["data"].each do |a|
    images = File.read("./views/tags.html")

     images = images.gsub("{{images}}", a["images"]["standard_resolution"]["url"])

    client.puts images

  end #ends response["data"].each each block


end   #ends if statement for params path conditional


  client.close

end #ends loop






























