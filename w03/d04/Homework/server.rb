require 'sinatra'
require 'pry'

houses = [ "Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin" ]

get("/") do
	students = File.read("students.txt")
	erb(:index, { locals: { students: students, houses: houses } }) #, sort: sort
end

get("/students/new") do
	erb(:new)
end

get("/search") do 
	erb(:search)
end

get("/search/results") do
	student = params["student"].downcase
	students = File.read("students.txt")
	found = "Student Not Found"
	records = students.split(",")
		records.each do |record| 
		name = "#{record.split(" ")[0]} #{record.split(" ")[1]}" 
		if name == student
			index = records.index(record) 
			found = records[index]
		end
	end
	erb(:student, { locals: { found: found } })
end

get("/students/show") do
	students = File.read("students.txt")
	records = students.split(",")
	student = params[:student]
	index = ""
	found = ""
	records.each do |record| 
		name = "#{record.split(" ")[0]} #{record.split(" ")[1]}" 
		if name == student
			index = records.index(record) 
			found = records[index]
		end
	end
	erb(:student, { locals: { found: found } })
end

post("/students/new") do
	name = params["name"].downcase
	age = params["age"].downcase
	spell = params["spell"].downcase
	sort = params["sort"]
	File.open("students.txt", "a") {|file| file.write "#{name} #{age} #{spell} #{sort},"}
	redirect ("/")	
end

post("/houses/:house") do
	student = params[:name].downcase
	house = params[:house]
	students = File.read("students.txt")
	index = ""
	records = students.split(",")
	records.each do |record|
		name = "#{record.split(" ")[0]} #{record.split(" ")[1]}" 
		if name == student
			index = records.index(record) 
		end
	end
	records[index] = records[index].split(" ")
	records[index][4] = "#{house}"
	records[index] = records[index].join(" ")
	students = records.join(",")

	File.open("students.txt", "w") {|file| file.write "#{students},"}
	redirect("/")
end

get("/houses/:house") do
	house = params[:house]
	students = File.read("students.txt")
	erb(:house, { locals: { house: house, students: students}})
end