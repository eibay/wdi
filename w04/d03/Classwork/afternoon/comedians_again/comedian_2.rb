class Comedian


   def initialize(attr)
		@name = attr[:name]
		@age = attr[:age]
		@joke = attr[:joke]
   end
   
   def getInfo
      return @name 
   end

end

