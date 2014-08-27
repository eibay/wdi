require 'pry'


comedians = [ {"name" => "bob", "age" => 44, "joke" => "Joke 1 ... hahahah"}, {"name" => "jet", "age" => 35, "joke" => "Joke 2 ..."}, {"name" => "yoyo", "age" => 25, "joke" => "Joke3 LOL"}]


class Comedian

	def initialize(hash)
		@all = []

		hash.each do |comedian|
			@name = comedian["name"]
			@age = comedian["age"]
			@joke = comedian["joke"]
			@all.push({"name" => @name, "age" => @age, "joke" => @joke})

		end
	end

	def getInfo
		return @all
	end
end


all_comedians = Comedian.new(comedians)
comedian_array = all_comedians.getInfo

	comedian_array.each do |comedian|
		puts "#{comedian["name"]}, #{comedian["age"]}, #{comedian["joke"]}"
	end
