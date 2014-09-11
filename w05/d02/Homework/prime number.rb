require "pry"



prime = (1..100).select { |a|
    (1..a).select{ |b|
      a%b==0
    }.size==2
  }

print prime

(3..5).select do |a|
  (1..(a-1)).select do |b|
   a !=b && a!= 1 && b!=1 && a%b!=0
  end
  binding.pry
end 


def prime(number)
  found_divisor = false

  (2..number - 1).each do |i|
    if number % i == 0
      found_divisor = true
    end
  end

  return found_divisor
end

(1..100).each do |num|
  if prime(num)
    puts num 
  end
end


# or as with a method


# def is_prime?(*nums)
#    		nums.each do |num|
#       		return false if num == 1
#      		next if num == 2 # 2 needs to be skipped. special case
#       		i = 2  # reset for each num
#       		while i < num 
#         		return false if num % i == 0  # modulo == 0 for any number is not prime
#         		i += 1   
#       		end
#    		end
#    		true # reach here only if all the numbers are prime
# 	end

# end 