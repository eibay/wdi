eval File.read("./students.rb")  

$students.each do |student|
	puts "#{student["login"]} was created at #{student["created_at"]}"
end 