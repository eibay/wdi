class Dog

end
##########################################
# Pry(main)> 	class Dog                                                                                                                                                                                           
# Pry(main)		* end                                                                                                                                                                                                 
# 				nil
# you can call .new on class Dog

##########################################
# Pry(main)> 	Dog.new                                                                                                                                                                                             
# 				#<Dog:0x007faeb2a64bf0>

# Dog.new creates a new instance of the dog class

##########################################
# [4] Pry(main)> 	fido = Dog.new                                                                                                                                                                                      
# 					#<Dog:0x007faeb08883b0>
# [5] Pry(main)> 	BENJI = Dog.new                                                                                                                                                                                     
# 					#<Dog:0x007faeb18bca60>    

# fido/benji calls an instance of Dog.new
##########################################

class Dog

	def bark
		puts "WOOOF!"
	end
end
##########################################
# [10] Pry(main)> 		class Dog                                                                                                                                                                                          
# [10] Pry(main)*   		def bark                                                                                                                                                                                         
# [10] Pry(main)*     	puts "WOOOF!"                                                                                                                                                                                                                                                                                                                                                                                   
# [10] Pry(main)*   		end                                                                                                                                                                                              
# [10] Pry(main)* 		end  
# :bark
##########################################
# 11] Pry(main)> 		fido = Dog.new                                                                                                                                                                                     
# 						#<Dog:0x007faeb108b990>
##########################################
# [12] Pry(main)> 		fido.bark                                                                                                                                                                                          
# 						WOOOF!
# 						nil
##########################################

class Dog
	def initialize(name)
		@name = name
	end

	def bark
		puts "WOOOF!"
	end

	def hello
		puts "Hello, I am #{@name}"
	end
end
##########################################

# [52] Pry(main)> 	class Dog                                                                                                                                                                                          
# [52] Pry(main)*   	def initialize(name)                                                                                                                                                                             
# [52] Pry(main)*     	@name = name                                                                                                                                                                                   
# [52] Pry(main)*   	end                                                                                                                                                                                              
# [52] Pry(main)*                                                                                                                                                                                                    
# [52] Pry(main)*   	def bark                                                                                                                                                                                         
# [52] Pry(main)*     	puts "WOOOF!"                                                                                                                                                                                  
# [52] Pry(main)*   	end                                                                                                                                                                                              
# [52] Pry(main)*                                                                                                                                                                                                    
# [52] Pry(main)*   	def hello                                                                                                                                                                                        
# [52] Pry(main)*     	puts "Hello, I am #{@name}"                                                                                                                                                                    
# [52] Pry(main)*   	end                                                                                                                                                                                              
# [52] Pry(main)* 		end                                                                                                                                                                                                
# 						:hello
# ##########################################

# [53] Pry(main)> 	fido.Dog.new("fido")                                                                                                                                                                               
# 					NoMethodError: undefined method `Dog' for #<Dog:0x007fa813ac97f8 @name="fido">
# 					from (pry):138:in `__pry__'

# ##########################################

# [54] Pry(main)> 	fido.hello                                                                                                                                                                                         
# 					Hello, I am fido
# 					nil
##########################################

class Dog
	def initialize(name, age, breed)
		@name = name
		@age = age
		@breed = breed
	end

	def bark
		puts "WOOOF!"
	end

	def hello
		puts "Hello, I am #{@name} #{@age} years old and a #{@breed}."
	end
end

# ##########################################
# [59] Pry(main)> 		class Dog                                                                                                                                                                                          
# [59] Pry(main)*   		def initialize(name, age, breed)                                                                                                                                                                 
# [59] Pry(main)*     	@name = name                                                                                                                                                                                   
# [59] Pry(main)*     	@age = age                                                                                                                                                                                     
# [59] Pry(main)*     	@breed = breed                                                                                                                                                                                 
# [59] Pry(main)*   		end                                                                                                                                                                                              
# [59] Pry(main)*                                                                                                                                                                                                    
# [59] Pry(main)*   		def bark                                                                                                                                                                                         
# [59] Pry(main)*     	puts "WOOOF!"                                                                                                                                                                                  
# [59] Pry(main)*   		end                                                                                                                                                                                              
# [59] Pry(main)*                                                                                                                                                                                                    
# [59] Pry(main)*   		def hello                                                                                                                                                                                        
# [59] Pry(main)*     	puts "Hello, I am #{@name} #{@age} years old and a #{@breed}."                                                                                                                                 
# [59] Pry(main)*   		end                                                                                                                                                                                              
# [59] Pry(main)* 		end                                                                                                                                                                                                
# 						:hello
# ##########################################

# [61] Pry(main)> 	dog1= Dog.new("benji", 6, "yorkie")                                                                                                                                                                
# # 					<Dog:0x007fa815902c88 @name="benji", @age=6, @breed="yorkie">

# ##########################################

# [62] Pry(main)> 	dog1.hello                                                                                                                                                                                         
# 					Hello, I am benji 6 years old and a yorkie.
# 					nil
# ##########################################


