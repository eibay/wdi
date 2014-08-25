require 'pry'
require 'json'
require 'uri'

puts "Seattle Grace Hospital -- PATIENT CONDITION SEARCH"
puts
puts "Search patients for condition:"
puts
query = gets.chomp
query = URI.decode(query)

file = JSON.parse(File.read('./patient_list.txt'))

file.each do |patient|
  not_found = []
  if patient["condition"].include?(query)
    puts "#{patient['first_name']} #{patient["last_name"]} -- Date Admitted: #{patient["date_admitted"]}"
  elsif !patient["condition"].include?(query)
    not_found << patient["name"]
  # else
  #   puts "No patients found with #{query}."
  end
end

# index = 0
# while index < file.length
#   if file[index]["condition"] == query
#     puts file[index]["first_name"] + " " + file[index]["last_name"]
#     break
#   else
#     puts "No patient found with #{query}."
#   end
#   index += 1
# end
