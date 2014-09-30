require 'active_record'

class Item 
  def to_json 
    {item: self.item}.to_json  
  end 

end 