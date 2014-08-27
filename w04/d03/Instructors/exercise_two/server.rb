require_relative './lib/comedian'

info1 = {"name" => "sean", "age" => 30, "joke" => "Sigh..."}
info2 = {"name" => "jeff", "age" => 30, "joke" => "Oh..."}
info3 = {"name" => "neel", "age" => 30, "joke" => "Ah..."}

com1 = Comedian.new(info1)
com2 = Comedian.new(info2)
com3 = Comedian.new(info3)

comedians = [com1, com2, com3]

comedians.each do |comedian|
	name = comedian.getInfo["name"]
	age = comedian.getInfo["age"]
	joke = comedian.getInfo["joke"]

	puts "Im #{name}, a #{age}year old. My favorite joke is #{joke}"
end