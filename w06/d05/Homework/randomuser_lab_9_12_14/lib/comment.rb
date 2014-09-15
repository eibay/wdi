require 'active_record'

class Comment < ActiveRecord::Base
  def user
    User.find_by({id: self.user_id})
  end
end