require 'pry'

require_relative './instance_methods/comedians2.rb'



info = {"name"=> "Sean", "age"=> 34}
comedian1 = Comedian.new(info)
puts comedian1.getInfo["name"]+ (comedian1.getInfo["age"]).to_s
#+ comedian1.getInfo["joke"]
#makes it so you dont need all the information
#can just have some and it works