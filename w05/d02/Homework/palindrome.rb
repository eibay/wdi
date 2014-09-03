require 'pry'
originstring = "go hang a salami im a lasagna hog"
string = originstring.split(" ").join("")
counter = 0
looper = -1
total = string.length
forward = []
backward = []
while counter < total
	forward<<string[counter]
	counter += 1
end
while looper.abs < total + 1
	backward<<string[looper]
	looper -= 1
end
if forward == backward
	puts "'#{originstring}' is a palindrome!"
else 
	puts "'#{originstring}' is NOT a palindrome"
end
