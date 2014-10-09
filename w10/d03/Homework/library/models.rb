class Book < ActiveRecord::Base
end

class Borrow < ActiveRecord::Base
end



class Person < ActiveRecord::Base
  self.has_many(:borrows)
end


