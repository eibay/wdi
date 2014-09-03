class Array 
	def zero_front
		zero_arr = self.select &:zero? 
		nonzero = self.select do |n|
			!n.zero?
		end 
		[zero_arr, nonzero].flatten 
	end 
end 

# it lacks grace but... # 

def passed
	puts "test passed!"
end 

if [1, 0, 0, 1].zero_front == [0, 0, 1, 1]
	passed 
end 

if [0, 1, 1, 0, 1].zero_front == [0, 0, 1, 1, 1]
	passed 
end 

if [1, 0].zero_front == [0, 1]
	passed  
end 