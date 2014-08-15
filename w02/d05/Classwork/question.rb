path = "/the_forest?animal=monkeys&food=bananas"

# convert path into the following hash: 

h = {
	path: "the_forest", 
	query_params: {
		animal: "monkeys", 
		food: "bananas"
	}
}

{:path=>"the_forest", 
	:query_params=>
	{:animal=>"monkeys", 
		:food=>"bananas"
	}
}



class String 
	def magic
		$v = {}
		$v[:path] = self[1, self.helper('?')-1] 
		$v[:query_params] = {}
		bits = self.smash_brooms
		pieces = bits.smash_them_some_more 
		pieces.they_grow_back		
		$v 
	end 

	# return index of char fetch_me_some_buckets_of_water   
	def helper fetch_me_some_buckets_of_water 
		i = 0 
		self.each_char do |char|
			if char == fetch_me_some_buckets_of_water
				return i 
			end   
			i += 1 
		end 
	end 

	def smash_brooms
		substr = self.split '?'
		substr[1]
	end 

	def smash_them_some_more
		self.split '&'
	end 
end 

class Array 
	def they_grow_back 
		self.each do |pieces|
			broomstick = pieces.split '='
			$v[:query_params][broomstick[0].to_sym] = broomstick[1]
		end 
	end 
end 

 

if path.magic == h  
	puts "Magic is really working!"
else 
	puts path.magic  
	puts h 
end 