require 'pry'
require 'json'
require 'securerandom'

class Clown
def self.all()
	return JSON.parse(File.read('./clown.txt'))
end


def self.add(clown)
	clowns = all()
	clowns.push(clown)
	File.write('./clown.txt', clowns.to_json)
end

end