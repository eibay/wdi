string = "abcxxxxx"

counter = 0
looper = 1
total = 0
while counter < string.length
if string[counter] == "x" && string[looper] == "x"
	counter += 1
	looper += 1
	total += 1
else
	counter += 1
	looper += 1
end
end
puts total