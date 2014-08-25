require 'pry'
require 'json'

roster = JSON.parse(File.read("./data/patients.txt"))

puts "Generate a list of patients with a specified condition."
puts "Enter the condition for which you would like to execute a search:"

condition = gets.chomp.downcase

hits = []

roster.each do |patient|
	if patient["condition"] == condition
		hits << "#{patient["first"]} #{patient["last"]} was admitted on #{patient["admitted"]}."
	end
end

if hits.empty?
	puts "There is no patient admitted for that condition at Seattle Grace."
else
	puts "Here is a list of patients suffering from the conditiion \"#{condition}\"."
	puts hits.join("\n")
end

puts Time.now