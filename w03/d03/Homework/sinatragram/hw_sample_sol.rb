# Hey,
# I was able to get the location and by tag.
# Here is my ruby file
require 'sinatra'
require 'httparty'
require 'pry'
get("/") do
	erb(:index)
end

get("/tag") do

	tagword = request.params["tag"]

	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tagword}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

	erb(:secondpage, { locals: { response: response}})	
end

get("/location") do
	lat = request.params["latitude"].to_f
	lon = request.params["longitude"].to_f
	
	response1 = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lon}&client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

	erb(:location, {locals: {response1: response1}})
end


here is my index page
<html>
<head>
<link rel ="stylesheet" type=text/css href="/styles.css">
	<link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>
</head>
<body>

<form action="/tag" method="GET">
<input type="text" name="tag" placeholder="enter a tag"/>
<button>SEARCH</button>
</form>

# OR 

# weren't we supposed to get the lat and long related to the pictures? if so woulnd't that look similar to how we're pulling out the values for the picture, like URL?-->

<form action="/location" method="GET">
<input type="text" name="latitude" placeholder="enter a latitude"/>
<input type="text" name="longitude"
placeholder="enter a longitude"/>
<button>SEARCH</button>
</form>


</body>
</html>

here is my name page - I called it second page
<html>
<head>
<link rel ="stylesheet" type=text/css href="/styles.css">
	<link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>
</head>


<body>
	<a href="/"><h1>Pictures</h1></a>
	<% response["data"].each do |pic| %> 

		<a href="<%= pic["images"]["standard_resolution"]["url"] %>"><img src='<%= pic["images"]["standard_resolution"]["url"] %>' /></a>  
	<% end %>


  
</body>
</html>

here is my location page

<html>
<head>
<link rel ="stylesheet" type=text/css href="/styles.css">
	<link href='http://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet' type='text/css'>
</head>
<body>
<a href="/"><h1>Pictures</h1></a>

<% response1["data"].each do |pic|
	%>

<a href="<%= pic["images"]["standard_resolution"]["url"] %>"><img src='<%=pic["images"]["standard_resolution"]["url"] %>' /></a>
<% end %>

</body>

	

</html>
