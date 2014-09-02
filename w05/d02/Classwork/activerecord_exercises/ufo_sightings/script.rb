require 'json'

f = File.open "./ufo_formatted.json"
arr = JSON.load f


# to determine varchar(length) for KEY in schema.sql # 

def varchar_size(json_data, key) 
	results = []
	json_data.each do |ufo|
		results << ufo[key]
	end
	results = results.uniq.sort_by &:length
	# print results in easy to read form #  
	puts results.join ",  "
	# return length of longest str for key # 
	results.pop.length
end  


# main script # 

shape_length = varchar_size arr, "shape"
puts "The longest str length for shape data is #{shape_length}."

duration_length = varchar_size arr, "duration"
puts "The longest str length for duration data is #{duration_length}."