require 'active_record'

class Book < ActiveRecord::Base

end

class Child < ActiveRecord::Base

end

class Borrowedbook < ActiveRecord::Base
  self.has_many(:books)
  self.has_many(:children)
end