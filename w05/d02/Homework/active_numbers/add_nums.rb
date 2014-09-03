require_relative "./connection"
require_relative "./model"
require 'pry'

nums = [*0..1000]
rand_nums = nums.shuffle

rand_nums.each do |i| 
	if Number.all.length == 30
		break
	end
	rand_hash = {number: i}
	Number.create(rand_hash)	
end

binding.pry