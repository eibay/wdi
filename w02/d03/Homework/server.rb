require "socket"
require "liquid"
eval File.read "students.rb" 


def view which, options  
	fn = "./views/#{which}/index.html.liquid"
	f = File.read fn   
	p = Liquid::Template.parse f  
	p.render options    
end 

s = TCPServer.new 2000 

loop do 

	c = s.accept 
	r = c.gets
	path = r.split[1]

	# for debugging 
	# puts path 
 
 	idx_opt = {"students" => $students, "stylesheet" => "/styelsheets/styles.css"}

	if path == '/'
		c.puts view("index", idx_opt)
	end  

	wants = path.delete '/'  
	puts "They want #{wants}!" # for debugging

	$students.each do |student|
		if student["login"] == wants  
			std_opt = {"student" => student, "stylesheet" => "/styelsheets/styles.css"}
			c.puts view("students", std_opt) 
		end 
	end 


	c.close 
end 