class Book < ActiveRecord::Base
end

class User < ActiveRecord::Base
	self.has_many(:borrowed_books)
end

class Borrowed_Book < ActiveRecord::Base
end
