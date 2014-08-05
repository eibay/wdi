Puts "gimme gas"
gas = gets.chomp.to_i
until gas == 0
	puts gas -=1
	puts "running..."
end
	if gas == 0
		print "car shut down"
	end