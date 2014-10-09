class Member < ActiveRecord::Base
	self.has_many(:books)
end

class Book < ActiveRecord::Base
	  
end