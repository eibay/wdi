def zeroFront(array)
	array.sort! {|a,b| a <=> b }
end

puts zeroFront([1, 0, 0, 1])
  #=> [0, 0, 1, 1]
puts zeroFront([0, 1, 1, 0, 1])
  #=> [0, 0, 1, 1, 1]
puts zeroFront([1, 0])
  #=> [0, 1]