require 'time'
eval File.read("./students.rb")  

class String 
	def blue
		"\033[1;34m" + self + "\033[0m"
	end 

	def purple 
		"\033[1;35m" + self + "\033[0m"
	end 
end 

$students.each do |student|
	t_obj = Time.parse student["created_at"]
	t = t_obj.strftime "%A, %B %_d, %Y"
	n = student["login"] 
	puts "#{n.blue} was created on #{t.purple}."
end 