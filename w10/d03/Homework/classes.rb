require 'active_record'

class Book < ActiveRecord::Base
end 

class Child < ActiveRecord::Base
end

class BorrowedBook < ActiveRecord::Base
	self.has_many(:children)
	self.has_many(:books)
end
