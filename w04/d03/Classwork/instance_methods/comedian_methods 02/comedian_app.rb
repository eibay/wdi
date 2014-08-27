require_relative './comedian.rb'
require 'pry'

inky = Comedian.new({"name" => "Inky", "age" => 35, "joke" => "So what's the deal with airline food..."})
blinky = Comedian.new({"name" => "Blinky", "age" => 35, "joke" => "Why did the chicken cross the road?"})
pinky = Comedian.new({"name" => "Pinky", "age" => 36, "joke" => "There are three guys at a bar..."})
clyde = Comedian.new({"name" => "Clyde", "age" => 37, "joke" => "Wakka Wakka Wakka"})

comedians = [inky, blinky, pinky, clyde]

comedians.each do |x|
	# puts x.getInfo
	puts x.smooth_return
end


