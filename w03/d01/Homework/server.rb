require 'socket'
require 'HTTParty'
require 'pry'

server = TCPServer.new 2000

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


while true
  client = server.accept
  request = client.gets 
  url = request.split(" ")[1]
  params = parse_url(url)

#search page  
if params [:path] == "/"
  html = File.read("./views/index.html")
  client.puts(html)

#stylesheet
elsif params[:path] == "/styles.css"
  css = File.read('./stylesheets/style.css')
  client.puts(css)

# # binding.pry
elsif params [:path] == "/tag"
  tag = params[:query_params][:specific_tag]
  response = HTTParty.get("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=3bbdd8399e754e5b8e24bd968905298f")

  html = File.read("./views/photo.html")
  html = html.gsub("{{specific_tag}}", tag)

instagram_array = []

["data"].each do |x|
    individual_photo = File.read ("./views/instagram_photo.html")
    individual_photo = individual_photo.gsub("{{images}}", x["images"])
    instagram_array.push(individual_photo)
  end

#error page
else
 	html = File.read("./views/error.html")
 	client.puts(html)

end
client.close
end