require 'pry'
require_relative './db/connection.rb'
list = Senator.all

counter = 0

while counter == 0
puts "which senator's bills would you like to peruse? Enter a last name, list, or end."
answer = gets.chomp
if answer == "list"
	list.each do |x|
		puts x["lname"]
	end
elsif answer == "end"
	counter += 1
else 
	senator = Senator.find_by lname: answer
	written = senator.bills
	written.each do |x| 
		puts x["short_title"] 
	end
	


end
end