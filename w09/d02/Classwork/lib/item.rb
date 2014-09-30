require 'active_record'
require 'json'

class Item 
  def to_json 
    {item: self.item}.to_json  
  end 

end 