require 'pry'

class Shirt
	def initialize(hash)
		@hash = hash
	end

	def getInfo
		return {
			"first_name" => @first_name,
			"last_name" => @last_name,
			"gender" => @gender,
			"city" => @city,
			"state" => @state
		}
	end
end

binding.pry