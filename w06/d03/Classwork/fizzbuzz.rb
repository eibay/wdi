n = 1

while n <= 100

	if n % 3 == 0 && n % 5 == 0
		puts 'fizzbuzz'
	elsif n % 3 == 0 
		puts 'fizz'
	elsif n % 5 == 0
		puts 'buzz'
	else
		puts n
	end
	n += 1
	
end
