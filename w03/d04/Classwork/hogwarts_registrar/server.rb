require 'sinatra'
require 'pry'
require 'uri'

list = {}
name_list = []
gryffindor_list = []
slytherin_list = []



get("/students/new") do
	erb(:index)
end

post("/") do
	name = params["name"]
	age = params["age"]
	favorite_spell = params["favorite_spell"]

	# <a href="/students/show?specific_name=#{name}">
	list["#{name}"] = {"Name" => "#{name}", "Age" => "#{age}", "Favorite Spell" => "#{favorite_spell}"}
	name_list << "<li style='margin-bottom: 22px'><a href='/students/show?specific_name=#{name}'>#{name}</a><form action='houses?name=#{name}' method='POST'><button type='submit'>Sorting Hat</button></form></li>"

	erb(:students, { locals: { students: name_list.join(' ') }})
end

get("/students/show") do
	name = request["specific_name"]
	profile = list["#{name}"]
	name = profile["Name"]
	age = profile["Age"]
	favorite_spell = profile["Favorite Spell"]

	html = "<h2 id='name'>#{name}</h2><ul><li>Age: #{age}</li>\n<li>favorite Spell: #{favorite_spell}</li></ul>"
	erb(:student, { locals: { html: html, name: name }})
end

get("/search") do
	name = URI.decode(params["student"])
	if list.has_key?(name)
		erb(:search, { locals: { student: "<p>#{name} has already resistered.</p>"}})
	else
		erb(:search, { locals: { student: "<p>#{name} has not resistered yet.</p>"}})
	end
end

post("/houses") do
	sorting_hat = ["Gryffindor", "Slytherin"]
	house = sorting_hat.sample
	if house == "Gryffindor"
		name = request["name"]
		gryffindor_list << name = "<li><a href='/students/show?specific_name=#{name}'>#{name}</a></li>"
		erb(:gryffindor, { locals: { student: gryffindor_list.join(' ') }})
	else
		name = request["name"]
		slytherin_list << name = "<li><a href='/students/show?specific_name=#{name}'>#{name}</a></li>"
		erb(:slytherin, { locals: { student: slytherin_list.join(' ') }})
	end
end

get("/") do
	erb(:students, { locals: { students: name_list.join(' ') }})
end

get("/houses/gryffindor") do
	erb(:gryffindor, { locals: { student: gryffindor_list.join(' ') }})
end

get("/houses/slytherin") do
	erb(:slytherin, { locals: { student: slytherin_list.join(' ') }})
end












