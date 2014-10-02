# 1. 

# def joke
# 	puts "knock Knock"
# end

# joke

# 2. 

# def hello(name)
# 	'Hello ' + name
# end

# puts(hello('Mama'))

# 3.

# names = ["Jon", "Arya", "Bob", "Ned"]

# def outputnames(array)
#   array.each do |n|
#     puts "Hello " + n
#   end
# end

# outputnames(names)

# 4.

# names = ["Jon", "Arya", "Bob", "Ned"]

# def outputnames(array)
#   new_array=[]
#   array.each do |name|
#   	new_array << "Hello #{name}"
# end
# end


# print outputnames(names)

# 5.

# def double(number)
# 	return number * 2
# end

# print double(9999)

# 6.

# def double(number)
# 	return number * 2
# end



# def quadruple(number)
# 	return (double(number) + double(number))
# end

# print quadruple(4)

# 7.

# hash = {
# 	jim: "red",
# 	joe: "blue",
# 	mama: "green"
# }

# def fav_colors(colors)
# 	colors.each do |k,v|
# 		puts "#{k}'s favorite color is #{v}"
# 	end
# end

# fav_colors(hash)

# 8.

# hash_one ={
# 	"peanut" => "butter",
# 	"and" => "jelly",
# 	"jelly" => "yummy"
# }

# hash_two = {
# 	"mmm" => "dat",
# 	"jelly" => "with",
# 	"peanut" => "butter"
# }

# def pbj(one, two)
# 	combine_hash = one.merge(two) {|key, first, second| first + " " + second }
# 	puts combine_hash
# end

# pbj(hash_one, hash_two)
