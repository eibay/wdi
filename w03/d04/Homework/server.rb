require 'pry'
require 'sinatra'
require 'io/console'
studAll = []
studTemp = []
studList = " "
newstudent = " "
get "/" do
	studList = " "
	newstudent = " "
	studAll.each { |x|
		if x[:school] == "no"
			
			newstudent += "<li><a href='/students/show/#{x[:name]}'>#{x[:name]}</a><form action='/sort/#{x[:name]}' method='POST'><input type='hidden' name='sort'><button>SORT!!!</button></li>"
		elsif studList += "<li><a href='/students/show/#{x[:name]}'>#{x[:name]}</a></li>"
		end
	}
	
	erb(:index, locals: { students: studList, newstudents: newstudent} )
end

get "/students/new" do
	erb(:register)
end

post "/enroll" do
	newstudent = " "
	name = params["name"]
	age = params["age"]
	spell = params["spell"]
	school = "no"
	studTemp<<{name: name, age: age, spell: spell, school: school}
	studNew = "<p>Name: #{name}. Age: #{age}. Favorite spell: #{spell}<p>
	<a href='/yes'>This info is correct.</a></br><a href='/students/new'>This info is not correct.</a>"

	erb(:confirm, locals: { studnew: studNew})
end

get "/yes" do
	
		studAll += studTemp
		studTemp.clear
		
	erb(:confirmed)
end

get "/students/show/:name"  do
	newstudent = " "
	profile = " "
	studAll.each { |x| 
		
		if x[:name] == params["name"]
			if x[:school] == "no"
			profile = "<p>#{x[:name]} is #{x[:age]} and can kill you with #{x[:spell]}.</p>" 
			else profile = "<p>#{x[:name]} is #{x[:age]} and can kill you with #{x[:spell]} if you ever step foot in #{x[:school]}"
			end 
		end
	}

erb(:profile, locals: { file: profile, name: params["name"]})
end

get "/search" do
	newstudent = " "
	erb(:search)
end

post "/search" do

	profile = " "
	studAll.each { |x| 
		
		if x[:name] != params["name"]
			profile = "<p>No luck.  Perhaps #{params["name"]} is a student of Merlin's.</p>"
		else
			if x[:school] == "no"
			profile = "<p>#{x[:name]} is #{x[:age]} and can kill you with #{x[:spell]}.</p>" 
			else profile = "<p>#{x[:name]} is #{x[:age]} and can kill you with #{x[:spell]} if you ever step foot in #{x[:school]}"
			end 
		end 
	}

erb(:profile, locals: { file: profile, name: params["name"]})
end

post "/sort/:name" do
	housNum = rand(3)
	if housNum == 0
		school = "Gryffindor"
	elsif housNum == 1
		school = "Hufflepuff"
	elsif housNum == 2
		school = "Ravenclaw"
	elsif housNum == 3
		school = "Slytherin"
	else
		school = "Ravenclaw"
	end
	profile = " "
	newstudent = " "
	studAll.each { |x| 
		
		if x[:name] == params["name"]
			x[:school] = school 
		
		profile = "<p>#{x[:name]} is #{x[:age]} and can kill you with #{x[:spell]} if you ever step foot in #{x[:school]}"
		else profile = "<p>#{x[:name]} is #{x[:age]} and can kill you with #{x[:spell]} if you ever step foot in #{x[:school]}"
		end
	}
		
erb(:profile, locals: { file: profile, name: params["name"]})
end