require 'sinatra'
require 'yaml'
require 'pry'

# create or load the database #
if File.exist? "./database.yaml"
	f = File.read "./database.yaml"  
	$students = YAML.load f 
else 
	$students = []
end 

=begin create an opts hash #

opts = { :locals => {
	school_name: "Hogwarts School of Witchcraft &amp; Wizardry"
}} 
=end 

# create a student obj #
class Student 
	attr_accessor :student_name, :owl_name, :year_born, :favorite_spell, :house 

	def initialize n, o, b, f  
		@student_name = n 
		@owl_name = o 
		@year_born = b  
		@favorite_spell = f
		@house
		e = hat_sort  
	end 

	# implement the hat_sort algorithm # 
	def hat_sort 
		hat = Random.rand 4 
		case hat 
		when 0 
			return "Slitherand"
		when 1 
			return "Giffandoor"
		when 2 
			return "Hufflepuff"
		when 3 
			return "Ravenclaw"
		end 
	end 

end 

# put in main obj # 

def hat_sort 
	hat = Random.rand 4 
	case hat 
	when 0 
		return "Slitherand"
	when 1 
		return "Giffandoor"
	when 2 
		return "Hufflepuff"
	when 3 
		return "Ravenclaw"
	end 
end 


# main app #  

get '/' do 
	erb :index, {locals: {school_name: "Hogwarts School of Witchcraft &amp; Wizardry", view_name: "All Current Students", students: $students}} 
end 

get "/students/new" do

	erb :apply, {locals: {school_name: "Hogwarts School of Witchcraft &amp; Wizardry", view_name: "Apply!" }}
end 

post "/students/new" do 

	house = hat_sort  

	st = {:student_name => params["student_name"], 
		:owl_name => params["owl_name"], 
		:year_born => params["year_born"],
		:favorite_spell => params["favorite_spell"],
		:house => house} 

	$students << st 

	File.open "./database.yaml", 'w' do |f| 
		f << $students.to_yaml 
	end 

	redirect '/'
end 

get "/students/show/:student_name" do
	profile = $students 
	profile = profile.select do |student| 
		student[:student_name].downcase.gsub(' ', '_') == params[:student_name]
	end 

	if profile.empty? 
		return "<h1>404 Not Found</h1>" 
	else 
		erb :student, {locals: {student: profile.first, view_name: params[:student_name], school_name: "Hogwarts School of Witchcraft &amp; Wizardry"}} 
	end 
end 

get "/houses/:house_name" do 
	h = $students  

	h = h.select do |student|
		student[:house] == params[:house_name].capitalize 
	end 

	if h.empty? 
		return "<h1>404 Not Found</h1>" 
	else  
		erb :house, { locals: {students: h, view_name: params[:house_name], school_name: "Hogwarts School of Witchcraft &amp; Wizardry"}} 
	end 
end 