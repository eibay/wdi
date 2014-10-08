require 'active_record'
ActiveRecord::Base.establish_connection({
  :adapter => "postgresql",
  :host => "localhost",
  :username => "AdrianMLin",
  :database => "library"
})

ActiveRecord::Base.logger = Logger.new(STDOUT)




class Book < ActiveRecord::Base
end

class Child < ActiveRecord::Base
  self.has_many(:borrowedbooks)
end

class Borrowedbook < ActiveRecord::Base
  self.has_one(:book)
end
