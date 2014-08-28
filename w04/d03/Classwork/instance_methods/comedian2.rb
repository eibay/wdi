require_relative './comedian_class'

comedians = []

loop do
	
jeff = Comedian.new("Jeff", 25, "Yo mama joke")
jesse = Comedian.new("Jesse", 30, "Seinfeld joke")
marc = Comedian.new("Marc", 28, "Joke")

comedians << jeff
comedians << jesse
comedians << marc


comedians.each do|x|
	puts x.getInfo
end
end

##########################################
#solution

require_relative './comedian'
require 'pry'

comedians = []

info = {"name" => "sean", "age" => 68, "joke" => "something funny"}
comedians << Comedian.new(info)

info = {"name" => "jeff", "age" => 68, "joke" => "something funny haha"}
comedians << Comedian.new(info)

info = {"name" => "neel", "age" => 68, "joke" => "something funny wow"}
comedians << Comedian.new(info)

comedians.each do |comedian|
	puts "comedian " + comedian.getInfo["name"] + " is " + comedian.getInfo["age"].to_s + " years old and has the joke " + comedian.getInfo["joke"]
end