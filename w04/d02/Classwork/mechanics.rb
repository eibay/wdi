require 'pry'
require 'json'

mechanics = JSON.parse(File.read('./mechanics.txt'))


mechanics.each do |x|
	x["id"] = SecureRandom.hex
end


# class ID
# 	def self.create(id)
# 		mechanic["id"] = SecureRandom.hex
# 		mechanics = self.all()
# 		mechanics.push(mechanic)
# 		mechanics_json = JSON.generate(mechanics)
# 		File.write('./mechanics.txt', mechanics_json)
# 	end

