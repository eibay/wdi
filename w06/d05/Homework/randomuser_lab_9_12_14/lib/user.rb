require 'active_record'

class User < ActiveRecord::Base
  def comments
      Comment.where({user_id: self.id})
    end
end