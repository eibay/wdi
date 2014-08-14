# put line between outputs 
def line 
	puts ''
end 

input = "{\"weather\":\"69 F\",\"humidity\":\"56%\",\"hash_crap\":true}\n"
puts "What can we do w/ this string?:"
print "\t"; p input
line   

=begin  
 

puts "First thought,"
puts "use eval:"
s = "hash = eval json"  
puts s 
eval s 

hdoc = <<VALUES 
w = hash[:weather]
p w 
hu = hash[:humidity]
p hu 
boo = hash[:hash_crap]
p boo 
VALUES

puts hdoc 
eval hdoc 

But none of this works because of the scare quotes. 

=end 


load_jason = "require 'json'"

puts "First, we load the JSON library:"
puts "\t" + load_jason
line 

eval load_jason

parse_it = "$h = JSON.parse input" 

puts "Then, we parse the JSON input:"
puts "\t" + parse_it
line 

eval parse_it 

profit = <<PROFIT 
puts $h["weather"]
puts $h["humidity"]
puts $h["hash_crap"]
PROFIT

puts "Finally, we can use the data in the JSON object:"
profit.each_line do |l|
	print "\t" + l 
end 
line 

eval profit
line 
puts "\tAmazing!"

line 

