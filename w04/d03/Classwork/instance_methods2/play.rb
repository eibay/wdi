require_relative './comedian.rb'

comedian = [ {"name" => "bob", "age" => 44, "joke" => "Joke 1 ... hahahah"}, {"name" => "jet", "age" => 35, "joke" => "Joke 2 ..."}, {"name" => "yoyo", "age" => 25, "joke" => "Joke3 LOL"}]

comedian.each do |comedian|
	comedian['name'] = Comedian.new(comedian['name'], comedian['age'], comedian['joke'])
	comedian['name'].tell_joke
end
