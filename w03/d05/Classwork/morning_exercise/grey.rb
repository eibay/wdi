require "pry"

grey_string = File.read('./greys.txt')


hash = grey_string.split("\n")



# hash_real = {}
array = []
another_array = []

hash.each do |item|
	array.push(item.split(","))
end

h = {}

array.each do |item|
   

end



h["name"] = "sean"
h["age"] = 23


h
=> {"name"=>"sean", "age"=>23}
# "ways to build up a hash"

1st way:
   myhash = {"name"=>"sean", "age"=>23}

2nd way:
	myhash = {}
	myhash["name"] = "sean"
	myhash["age"] = 23


