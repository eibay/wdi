require "sinatra"
require "pry"

student=[]


get("/students/new") do 
	erb(:index)
end

post("/") do 
	student.push params
	erb(:registered_students, { locals: { all_students: student }})
end 

get("/") do 
	erb(:registered_students, { locals: { all_students: student,  }})
end 

get("/students/show/:name") do 
	
	x=0
	while x < student.length                                                                                       
		if params[:name]==student[x]["name"]
		specific_student = "#{student[x]["name"]}, #{student[x]["age"]}, #{student[x]["spell"]}"
		return specific_student
		else
		x+=1
        end   
	end
	erb(:show, {locals: {info: specific_student}})
end

get("/search") do 
	erb(:search)
end
get("/search_results") do
	searched_name = params[:name]

	x=0
	while x < student.length                                                                                       
		if searched_name == student[x]["name"]
			returned_student = "#{student[x]["name"]}, #{student[x]["age"]}, #{student[x]["spell"]}"
			return returned_student
		else
			x+=1
        end
        if x == student.length 
        	none= "Student does not go to Hogwarts"
        	return none
        end
 erb(:search_results, {locals: { returned_student: returned_student, none: none}})
end
end








	

