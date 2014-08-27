require "json"

class Student

	def initialize(hash)
		@first = hash["first"]
		@last = hash["last"]
		@email = hash["email"]
	end 

	def getInfo
		return {"first" => @first, "last" => @last, "email" => @email}
	end
end

