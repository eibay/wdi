require 'active_record'
require 'json'

class Item < ActiveRecord::Base 
  def to_json 
    {item: self.item}.to_json  
  end 

end 