require_relative '../db/connection.rb'

class User < ActiveRecord::Base
  self.has_one(:account)
end

class Account < ActiveRecord::Base

end
