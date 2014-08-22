file = File.read 'greys.txt'

ary_raw = file.split("\n")

ary_split_comma = []
ary_raw.each do |list|
	split = list.split(",")
	ary_split_comma << split
end

array_cast = []

ary_split_comma.each do |character|
	hash_character = {}
	hash_character[:character] = character[0] unless character[0] == nil
	hash_character[:actor] = character[1] unless character[1] == nil
	hash_character[:episodes] = character[2].split(" ")[0].to_i unless character[2] == nil
	hash_character[:start_year] = character[3] unless character[3] == nil
	hash_character[:end_year] = character[4] unless character[4] == nil
	array_cast << hash_character
end

puts array_cast
	





