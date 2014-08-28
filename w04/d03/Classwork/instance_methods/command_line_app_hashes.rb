require_relative './class_command_line_app_hashes'

kevin_hart = Comedian.new("name" => "Kevin Hart", "age" => 40, "joke" => "haha" )

russell_peters = Comedian.new("name" => "Russell Peters", "age" => 45, "joke" => "haha take two" )

chris_rock = Comedian.new("name" => "Russell Peters", "age" => 50, "joke" => "haha take three" )

comedians = [kevin_hart, russell_peters, chris_rock]

comedians.each do |comedian|
puts comedian.getInfo
end

