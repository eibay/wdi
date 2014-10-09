require 'active_record'

class Child < ActiveRecord::Base
	self.has_many(:loans)
end

class Book < ActiveRecord::Base
end

class Loan < ActiveRecord::Base
	self.has_one(:book)
	self.has_one(:child)
end