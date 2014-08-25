require 'json'

puts "Welcome to Seattle Grace Hospital."
puts "Search for patient by condition:"
condition = gets.chomp

patients = JSON.parse(File.read('./patients.txt'))

results = patients.select do |patient|
	patient["condition"].downcase =~ Regexp.new(condition.downcase)
end

puts "All patients matching condition \"#{condition}\""
results.each do |result|
	date = result["date_time_admittance"]
	puts "#{result["first"]} #{result["last"]}, Admitted #{date}"
end