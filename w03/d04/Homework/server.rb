require 'sinatra'
require 'pry'

get("/") do
	students = File.read("students.txt")
	
	erb(:index, { locals: { students: students } })
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
		binding.pry
		if name == student
			index = records.index(record) 
			found = records[index]
		end
	end
	erb(:student, { locals: { found: found } })
end

get("/student") do
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
	File.open("students.txt", "a") {|file| file.write "#{name} #{age} #{spell},"}
	redirect ("/")	
end