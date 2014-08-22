require 'pry'
require 'sinatra'

kids = "./data/database.txt"

def generate_roster
	kids = "./data/database.txt"
	list = {}
	File.read(kids).split("\n").each do |entry|
		kid = entry.split(", ")
		list["#{kid[0]} #{kid[1]}"] = {
			first: kid[0],
			last: kid[1],
			age: kid[2],
			spell: kid[3],
			house: kid[4]
		}
	end
	list
end

get ("/") do
	File.read(kids) == "" ? list = {} : list = generate_roster
	erb(:index, locals: { list: list })
end

get ("/students/new") do
	erb(:enroll, locals: {})
end

get ("/students/show/") do
	list = generate_roster
	erb(:student, locals: { list: list, kid: "#{params["first"]} #{params["last"]}" })
end

get ("/search") do
	list = generate_roster
	hits = {}
	list.each_key do |kid|
		if params["search"].downcase == list[kid][:last].downcase
			hits[kid] = list[kid] 
		end
	end
	erb(:search_hits, locals: { list: hits })
end

get "/houses/gryffindor" do
	house = "Gryffindor"
	list = generate_roster
	members = {}
	list.each_key do |kid|
		if list[kid][:house] == house
			members[kid] = list[kid]
		end
	end
	erb(:houses, locals: { list: members, house: house })
end

get "/houses/ravenclaw" do
	house = "Ravenclaw"
	list = generate_roster
	members = {}
	list.each_key do |kid|
		if list[kid][:house] == house
			members[kid] = list[kid]
		end
	end
	erb(:houses, locals: { list: members, house: house })
end

get "/houses/hufflepuff" do
	house = "Hufflepuff"
	list = generate_roster
	members = {}
	list.each_key do |kid|
		if list[kid][:house] == house
			members[kid] = list[kid]
		end
	end
	erb(:houses, locals: { list: members, house: house })
end

get "/houses/slytherin" do
	house = "Slytherin"
	list = generate_roster
	members = {}
	list.each_key do |kid|
		if list[kid][:house] == house
			members[kid] = list[kid]
		end
	end
	erb(:houses, locals: { list: members, house: house })
end

post ("/") do
	File.open(kids, "a") {|db| db.write("#{params["first"]}, #{params["last"]}, #{params["age"]}, #{params["spell"]}, none\n")}
	list = generate_roster
	erb(:index, locals: { list: list })
end

post ("/sorting_hat") do
	str = File.read(kids)
	orig = str.scan(/#{params["first"]}, #{params["last"]}.+\n/)[0]
	update = orig.gsub("none", ["Gryffindor", "Ravenclaw", "Hufflepuff", "Slytherin"][rand(0..3)])
	roster = str.gsub(orig, update)
	File.write(kids, roster)
	redirect("/students/show/?first=#{params["first"]}&last=#{params["last"]}")
end