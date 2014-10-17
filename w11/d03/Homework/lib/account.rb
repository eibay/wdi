require 'active_record'

class Account < ActiveRecord::Base
  def user
    User.find_by({id: self.user_id})
  end
end

