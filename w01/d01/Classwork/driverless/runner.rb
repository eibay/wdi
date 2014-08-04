
puts("how much gas do you have?")

gas = gets.chomp
nogas = 0
gas= gas.to_i

while gas > nogas
	puts("you have #{gas} gas unit(s)")
	
	gas -= 1
end

puts("no gas")
