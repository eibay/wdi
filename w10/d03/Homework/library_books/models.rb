class Book < ActiveRecord::Base
	self.has_many(:borrowedbooks)
end

class Child < ActiveRecord::Base
	self.has_many(:borrowedbooks)
end

class Borrowedbook < ActiveRecord::Base

end