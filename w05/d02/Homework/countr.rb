arr = ('a'..'z').to_a
string = "dog"
counter = 0
total = 0
while counter < string.length
	letter = string[counter]
	total += arr.index(letter) + 1
	counter += 1
end
puts total