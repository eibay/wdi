require 'json'
require 'pry'

data = JSON.parse(File.read("./data.txt"))

puts "what condition shall we search for, doctor?"
search_condition = gets.chomp

data.each do |patient|
	if patient["condition"] == search_condition
		puts "#{patient['first_name']} #{patient['last_name']}; admitted #{patient['date_admission']}" 
	end
end


