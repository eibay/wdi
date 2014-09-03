require 'pry'

arr_of_nums = []

while true
	puts "What do you want?"
	resp = gets.chomp
	
	if resp == "show"
		puts arr_of_nums.join(", ")
	elsif resp.split(' ')[0] == "add"
		num = resp.split(' ')[1]
		arr_of_nums.push(num)
	else
		puts "guess you are done"
		break
	end
end

# binding.pry

