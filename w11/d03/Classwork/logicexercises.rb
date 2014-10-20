#1

(1..1000).each do |x|
	if x % 3 == 0 and x % 5 == 0
	puts x
	end
end

#2
first = 0
second = 1
i = 0
sum = 0
 
while i <= 4000000
  i = first + second
  sum += i 
  	if i % 2 == 0
  		first = second
  		second = i
end
