class Book < ActiveRecord::Base

end

class Child < ActiveRecord::Base
	self.has_many(:borrowedbook)
end

class Borrowedbook < ActiveRecord::Base
  self.has_one(:child)
  self.has_one(:book)
end

