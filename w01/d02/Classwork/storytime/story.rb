story = ['Fry is born without a delta brainwave', 'As a result, Fry is cryogenically frozen until 2999', 'In the future, Fry works on a spaceship', 'The spaceship hits a wormhole and crashes in 1941 Roswell, NM',]

q = "Do you want to hear a story?"
puts q 
a = gets.chomp 

class String  
	def affirmative?
		affirmations = ["yes", "sure", "yup", "y", "good", "si", "true", "ok", "yeah"]
		if affirmations.include? self.gsub(/[.,!?]/, "").downcase 
			return true 
		else 
			return false 
		end 
	end 

end  

q, i = "Do you want me to continue?", 0 
while a.affirmative? && i < story.length
	puts story[i] 
	i += 1 
	unless i == story.length 
		puts q 
		a = gets.chomp 
	end 
end 