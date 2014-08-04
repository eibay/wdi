
valid_locations = ["New York", "San Francisco", "Dallas", "Albequerque", "Toronto"]
puts "What destination?"
destination = gets.chomp
valid_locations.include?(destination) ? response = "Yes" : response = "No"
puts response

=begin
puts "What destination?"
destination = gets.chomp
if destination ==  "Toronto" or "New York" or "San Francisco" or "Dallas" or "Albequerque"
	puts "Yes"
else
	puts "No"
end
=end