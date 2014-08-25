require 'sinatra'
require 'csv'

houses=["Gryffindor" , "Slytherin", "Hufflepuff" , "Ravenclaw"]
# students=CSV.read("public/students.csv")
	students2=CSV.read("public/students.csv")




get "/" do
	students=CSV.read("public/students.csv")
	
	
erb(:index, {locals:{students: students}})
end



get "/students/new" do
	
erb(:add_student)

end

post "/students/new" do
	name=params[:name]
	age=params[:age]
	favorite_spell=params[:spell]
	add_student=File.open('public/students.csv', 'a') 
 	add_student.puts "#{name},#{age},#{favorite_spell}"
	add_student.close
	redirect "/"

end

get ("/students/show/:student/") do


	students=CSV.read("public/students.csv")
	
	erb(:individual_student, {locals:{students: students, name: params[:student]}})
end

get("/search") do
erb(:seach)
end

post("/search") do
	student=""
	puts params[:search]
	students=CSV.read("public/students.csv")
	students.each do |n|
		
		if(n[0]==params[:search])
			 puts student
			student="<a href='/students/show/#{n[0]}/'>#{params[:search]} is a student here</a>"
	end
end
	
	erb(:search_results, {locals:{ wizard: student}})
	# erb(:search_results)
end
post("/sortinghat") do

students=CSV.read("public/students.csv")
	name=params[:name]
	puts name
	house=houses.sample
	students2.each do |n|
		if(n[0]==name)
			puts n[0]
			n.push(house)
			puts n
		end
	end

	erb(:sortinghat, {locals:{your_house: house}})

#### mabye use f.each_line?

		
		
			 
			
	end







# post ("/search") do
# students=CSV.read("public/students.csv")
# 	students.each |n|
# 		if(n.include? params[:name])
# 			student="<a href='/students/show/#{params[:name]}'>#{params[:name]} is a student here</a>"
		
	
# 		else
# 			student="That student does not exist"
# 		end
# 	end
# 	erb(:search_results, {locals:{student: student}})
# end
