require 'sinatra'

get("/") do
  File.read("./views/index.html")
end

get("/name") do
	puts params["first_name"]
  html = File.read("./views/name.html")
  html = html.gsub("{{name}}", params["first_name"])
  
end

# get("/colors/:color/") do
#   html = File.read("./views/color.html")
#   html = html.gsub("{{color}}", params[:color])
#   html
# end
get("/colors") do
html =  File.read("./views/color.html")
html=html.gsub("{{color}}" , params["color"])
end
