
def is_prime?(num)
	half = num / 2
	prime = true
	while prime && half > 1
		prime = false if num % half == 0
		half -= 1
	end
	prime
end

primes = []

2.upto(100) do |num|
	primes << num if is_prime?(num)
end 
output = primes.join(", ")

puts output