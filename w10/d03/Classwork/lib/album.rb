require 'active_record'

class Album < ActiveRecord::Base
  def client
    Client.find_by({id: self.client_id})
  end

  def category
    Category.find_by({id: self.category_id})
  end
end

# self.has_many(:photos)
# shortcut method to use