 require 'json'
require 'pry'

patients = JSON.parse(File.read("./patients.txt"))
puts "What is the medical condition of the person you are looking for in?"

condition = gets.chomp

patient_w_condition = []
	patients.select do |a|
	if a["condition"] == condition
		patient_w_condition=  a["condition"] + ", " + a["first"] + " " + a["last"]
		end
	end 
 
puts patient_w_condition




# x = 0
# while x < patients.length
# 	binding.pry
# 	if patients[x]["condition"] == condition
# 		puts "You searched for #{condition}. We have found a patient, #{patients[x]['first']} #{patients[x]['last']}, who has #{patients[x]['condition']}. They were admitted to the hospital on #{patients[x]['date']}"
# 		x = patients.length + 1
# 	elsif x == patients.length-1
# 		puts "We do not have any patients who have #{condition}"
# 	end
# 	x += 1
# end


