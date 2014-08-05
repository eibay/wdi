=begin
gas = 20
# need to deplete by 1, i.e., subtract 1 and repeat to reach zero

while gas >0
puts gas.to_s + " units remaining"
gas -= 1
#could be gas = gas - 1 instead
end


if gas == 0
	puts "car shut down"
end
=end

gas = gets.chomp.to_1  #why not working for chomp undefined reason

while gas > 0
#puts gas.to_s + " units remaining"
gas -= 1
#could be gas = gas - 1 instead
end


if gas == 0
	puts "car shut down"
end
