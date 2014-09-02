
require_relative "./sunlight"
 
# to determine varchar(length) for KEY in schema.sql # 

def varchar_size(json_data, key) 
	results = []
	json_data.each do |ufo|
		results << ufo[key]
	end
	results = results.compact.sort_by &:length

	results.pop.length
end  


# main script # 


puts varchar_size all_bills, "short_title"
puts varchar_size all_bills, "introduced_on"