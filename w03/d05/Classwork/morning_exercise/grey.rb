require "pry"

grey_string = File.read('./greys.txt')


hash = grey_string.split("\n")



hash_real = {}
array = []

hash.each do |item|
	array.push(item.split(","))
end

binding.pry

hash_real = { "actor" => array[0],
  "role" => array[1],
  "episodes" => array[2],
  "year" => array[3]
}

