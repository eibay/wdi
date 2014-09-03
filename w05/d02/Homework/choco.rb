x = 17
big = x / 5

small = x % 5
puts "if you need #{x} kilos of chocolate you need #{big} big bars and #{small} small bars"

bigx = (x - 5) / 5


smallx = x % 5 + 5

if x % 5 == 0
puts "if you require small bars and you need #{x} kilos of chocolate you need #{bigx} big bars and #{smallx} small bars"
else 
	bigx += 1
	smallx -= 5
	puts "if you require small bars and you need #{x} kilos of chocolate you need #{bigx} big bars and #{smallx} small bars"
end