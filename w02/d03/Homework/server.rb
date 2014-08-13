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
 
 	idx_opt = {"students" => $students}

	if path == '/'
		c.puts view("index", idx_opt)
	end  

	wants = path.delete '/'  
	puts "They want #{wants}!" # for debugging

	$students.each do |student|
		if student["login"] == wants  
			std_opt = {"student" => student}
			c.puts view("students", std_opt) 
		end 
	end 

	if path == "/styles"
		# OK, this is dumb 
		c.puts File.read "./stylesheets/styles.css"
		puts "Sent styles"
	end 



	c.close 
end 