require 'json'
require 'pry'

patients=JSON.parse(File.read("public/patients.txt"))




puts "What condition do you want to search for?"

condition=gets.chomp

patients.each do |n|



	if(n["conditon"]==condition)
		puts n["first"]
		puts n["last"]
		puts n["admission"]
		puts condition
	end
end