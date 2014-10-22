require_relative "./robot1.rb"

r2d2 = Robot.new
c3PO = Robot.new

r2d2.speak
c3PO.speak

robots = Array.new

10.times do 
	robots.push(Robot.new)
end

robots.each do |robot|
	robot.speak
end