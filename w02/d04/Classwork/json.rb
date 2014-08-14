

puts "What can we do w/ this string?"

json = "{\"weather\":\"69 F\",\"humidity\":\"56%\",\"hash_crap\":true}\n"

p json 

puts "First thought,"
puts "use eval:"
s = "hash = eval json"  
puts s 
eval s 

hdoc = <<VALUES 
hash[:weather]
hash[:humidity]
hash[:hash_crap]
VALUES

puts hdoc 
eval hdoc 