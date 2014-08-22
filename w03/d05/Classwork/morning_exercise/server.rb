require 'sinatra'
require 'csv'
require 'yaml'

i = CSV.read "./greys.txt" 

$db = []

i.each do |l|
	char = {}
	char[:actor] = l[0]
	char[:name] = l[1]
	char[:episodes] = l[2].to_i 
	if l[3].nil? 
		char[:run] = nil 
	elsif l[3].include? '-' 
		range = l[3].split '-'
		char[:run] = (range[0].to_i..range[1].to_i).to_a  
	else 
		char[:run] =  [l[3].to_i] 
	end  
	puts char 
	$db << char
end 

get '/' do 

	erb :index, {locals: {chars: $db, view_name: "All Characters"} } 
end

get "/2007" do 
	chars = $db.select do |char|
		if char[:run].nil? 
			false 
		else  
			char[:run].include? 2007 
		end
	end 

	erb :index, {locals: {chars: chars, view_name: "2007"}}
end 

get "/doctors" do 
	chars = $db.select do |char|
		if char[:name].nil? 
			false
		else 
			char[:name].include? "Dr."
		end 
	end 

	erb :index, {locals: {chars: chars, view_name: "Doctors"}}
end 

get "/minor_chars" do 
	chars = $db.select do |char|
		char[:episodes] < 10  
	end

	erb :index, {locals: {chars: chars, view_name: "Minor Characters"}} 
end 

get "/stars" do 
	chars = $db.select do |char|
		char[:episodes] > 150  
	end 

	erb :index, {locals: {chars: chars, view_name: "The Stars"}}
end 