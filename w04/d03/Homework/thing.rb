require 'pry'
require_relative './comedian'



funny_men = []

infos = [{"name" => "Sam", "age" => 43, "fav_joke" => "yo hey was up"}, 
	{"name" => "Betty", "age" => 23, "fav_joke" => "Your Mama"},
	{"name" => "Frank", "age" => 12, "fav_joke" => "hha yoooo"}]

infos.each do |com|
	funny_man = Comedian.new(com)
	funny_man.get_info
	funny_men.push(funny_man)
end


# binding.pry



# comedians.each do |comedian|
# 	comedian.tell_joke
# end