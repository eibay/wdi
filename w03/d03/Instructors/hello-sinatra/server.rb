require 'sinatra'

get("/") do
  File.read("./views/index.html")
end

get("/name") do
  html = File.read("./views/name.html")
  html = html.gsub("{{name}}", request.params["first_name"])
  html
end

get("/colors/:color") do
  html = File.read("./views/color.html")
  html = html.gsub("{{color}}", params[:color])
  html
end