class Student

attr_accessor :first
attr_accessor :last
attr_accessor :email

def initialize(attributes)
	@first=attributes["first"]
	@last=attributes["last"]
	@email=attributes["email"]
	@dorm_id=attributes["dorm_id"]
end


def self.find_by(file, key , value)
	student=JSON.parse(File.read(file))
	student.find do |student|
		student[key].downcase==value.downcase
	end
end



def getInfo 
	return {first: @first , last: @last , email: @email}
end
end